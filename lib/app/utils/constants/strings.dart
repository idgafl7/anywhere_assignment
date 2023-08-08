// ignore_for_file: library_private_types_in_public_api

class EnvStrings {
  static const String baseURL = 'BASE_URL';
  static const String environment = 'ENVIRONMENT';
  static const String simpsonsEnv = 'simpsons';
  static const String theWireEnv = 'the_wire';
}

class UIStrings {
  static const simpsons = 'Simpsons';
  static const theWire = 'The Wire';
  static const noDescription = 'No Description';
  static const selectACharacter = 'Select a character';
  static const retry = 'Retry';
}

class QueryStrings {
  static const String simpsonsQuery = 'simpsons characters';
  static const String theWireQuery = 'the wire characters';
}

class ExceptionStrings {
  static const String internalServerExceptionMessage =
      'Something went wrong. Please try again.';
  static const String unauthorisedExceptionMessage = 'Unauthorised';
  static const String notFoundExceptionMessage = 'Not found';
  static const String requestCancelledExceptionMessage = 'Request cancelled';
  static const String unexpectedExceptionMessage =
      'Something went wrong. Please try again.';
  static const String defaultExceptionMessage =
      'Something went wrong. Please try again.';
  static const String requestTimeoutExceptionMessage =
      'Could not connect to the server.';
  static const String receiveTimeoutExceptionMessage =
      'Could not connect to the server.';
  static const String sendTimeoutExceptionMessage =
      'Could not connect to the server.';
  static const String noCharacterDataExceptionMessage =
      'No character Data Found';
}
