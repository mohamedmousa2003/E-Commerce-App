class Failures {
  String errorMessage;

  Failures({required this.errorMessage});
}

/// offline
class ServerError extends Failures {
  ServerError({required super.errorMessage});
}

//online
class NetworkError extends Failures {
  NetworkError({required super.errorMessage});
}
