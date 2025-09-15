sealed class APIException implements Exception {
  APIException(this.message);
  final String message;
}

class InvalidApiKeyException extends APIException {
  InvalidApiKeyException() : super('Invalid API key');
}

class NoInternetConnectionException extends APIException {
  NoInternetConnectionException() : super('No Internet connection');
}

class NotFoundException extends APIException {
  NotFoundException() : super('Not found');
}

class UnknownException extends APIException {
  UnknownException() : super('Some error occurred');
}

class OffsetException extends APIException {
  OffsetException() : super('Offset error');
}

class IncorrectIdException extends APIException {
  IncorrectIdException() : super('Incorrect ID');
}
