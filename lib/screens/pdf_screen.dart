import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:majlaat/widgets/custom_inkwell.dart';

import 'package:webview_flutter/webview_flutter.dart';

class PdfScreen extends StatefulWidget {
  String url;

  PdfScreen({
    super.key,
    required this.url,
  });

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        getWebView(),
        backButton(context),
      ],
    );
  }

  getWebView() {
    return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      onProgress: (int progress) {
        print('WebView is loading (progress : $progress%)');
        if (progress != 100) {}
      },
      javascriptChannels: <JavascriptChannel>{},
      onPageStarted: (String url) {
        print('Page started loading: $url');
      },
      onPageFinished: (String url) {
        print('Page finished loading: $url');
      },
      gestureNavigationEnabled: true,
      backgroundColor: const Color(0x00000000),
    );
  }

  Positioned backButton(BuildContext context) {
    return Positioned(
      top: 30,
      left: 30,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(bottom: 25, left: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 1,
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(0, 1),
              ),
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 1,
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(1, 0),
              ),
            ],
          ),
          height: 40,
          width: 40,
          child: CustomInkwell(
            borderRadius: 30,
            onTap: () {
              Navigator.pop(context);
            },
            child: const Center(
              child: Icon(
                CupertinoIcons.chevron_back,
                size: 35,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
