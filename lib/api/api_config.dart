// Class for specify Api calls configuration
class ApiConfig {
  static String? _urlScheme;
  static String get urlScheme => _urlScheme!;
  static String? _urlHost;
  static String get ulrHost => _urlHost!;
  static int? _urlPort;
  static int get urlPort => _urlPort!;
  static int? _api;
  static int? get api => _api;

  static void init(String urlScheme, String urlHost, int urlPort, int? api) {
    _urlScheme = urlScheme;
    _urlHost = urlHost;
    _urlPort = urlPort;
    _api = api;
  }
}
