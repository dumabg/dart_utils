class ServerStatusException implements Exception {
  int status;
  String? reasonPhrase;
  String callMessage;
  String path;
  bool isUnauthorized() => status == 401;
  bool isUpgradeRequired() => status == 426;
  ServerStatusException(
      this.path, this.status, this.reasonPhrase, this.callMessage);

  @override
  String toString() {
    return 'ServerStatusException: $status $reasonPhrase\n$path\n$callMessage';
  }
}
