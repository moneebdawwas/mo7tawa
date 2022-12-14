abstract class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  @override
  String toString() {
    return message;
  }
}

class ServerErrorException extends ApiException {
  ServerErrorException(String message) : super(message);
}

class NotAuthorizedException extends ApiException {
  NotAuthorizedException(String message) : super(message);
}

class UnknownErrorException extends ApiException {
  UnknownErrorException() : super("UnknownErrorException");
}

class ClearErrorException extends ApiException {
  ClearErrorException(String message) : super(message);
}

class NotFoundException extends ApiException {
  NotFoundException(String message) : super(message);
}

class TimeOutException extends ApiException {
  TimeOutException(String message) : super(message);
}
