import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:majlaat/services/api_exception.dart';
import 'package:majlaat/services/base_model.dart';

Duration apiCallTimeoutDuration = const Duration(seconds: 120);

const storage = FlutterSecureStorage();

Future<Map<String, dynamic>> postRequest(String url,
    {Map<String, String>? queryParams, var body}) async {
  var response;

  try {
    String? token = await storage.read(key: 'restToken');

    print(url);
    Uri requestUri = Uri.https(
      '',
      url,
      queryParams,
    );

    log('requestUrl: ${requestUri.toString()}');
    log('\nrequest body:\n${jsonEncode(body)}');
    // log('\nheaders:\n ${await getHeaders(token)}');

    response = await http
        .post(
          requestUri,
          //  headers: await getHeaders(token),
          body: jsonEncode(body),
        )
        .timeout(apiCallTimeoutDuration);

    log('response'
        '\nstatus code: ${response.statusCode.toString()}'
        '\nbody:\n${response.body}');

    BaseApiResponseModel responseModel =
        BaseApiResponseModel.fromJson(jsonDecode(response.body));

    if (response.statusCode == 500) {
      throw ServerErrorException("An error has occurred");
    }
    if (!responseModel.isSuccess!) {
      if (responseModel.errors![0]!.code! == 2) {
        throw NotAuthorizedException(
            responseModel.errors?[0]?.getDescription(false) ?? '');
      }
    }
  } catch (e) {
    print('The Error is $e');
  }
  return jsonDecode(response.body);
}

Future<Map<String, dynamic>> getRequest(
  String url, {
  Map<String, String>? queryParams,
}) async {
  var token = await storage.read(key: 'restToken');

  Uri uri = Uri.https('', url, queryParams);

  log('requestUrl: ${uri.toString()}');
  // log('\nheaders:\n ${await getHeaders(token)}');

  var response = await http.get(
    uri,
    // headers: await getHeaders(token),
  );

  log('response'
      '\nstatus code: ${response.statusCode.toString()}'
      '\nbody:\n${response.body}');

  BaseApiResponseModel responseModel =
      BaseApiResponseModel.fromJson(jsonDecode(response.body));

  if (!(responseModel.isSuccess ?? true)) {
    if (responseModel.errors![0]!.code! == 2) {
      throw NotAuthorizedException(
          responseModel.errors?[0]?.getDescription(false) ?? '');
    }
  }
  return jsonDecode(response.body);
}

// Future<Map<String, String>> getHeaders(String? token) async {
//   return <String, String>{
//     'Content-Type': 'application/json; charset=UTF-8',
//     'Accept-Language': 'en',
//     if (token != null) 'Cookie': 'ASP.NET_SessionId=$token',
//     'IsOldUser': 'false',
//   };
// }
