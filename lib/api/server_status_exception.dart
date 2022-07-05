class ServerStatusException implements Exception {
  int status;
  String? reasonPhrase;
  bool isUnauthorized() => status == 401;
  bool isUpgradeRequired() => status == 426;
  ServerStatusException(this.status, this.reasonPhrase);
}
