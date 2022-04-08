class ServerStatusException implements Exception {
  int status;
  String? reasonPhrase;
  bool isUnauthorized() => status == 401;
  ServerStatusException(this.status, this.reasonPhrase);
}
