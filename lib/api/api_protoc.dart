import 'dart:typed_data';
import 'package:http/http.dart' as $http;
import 'package:protobuf/protobuf.dart' as $pb;
import 'api_config.dart';
import 'server_status_exception.dart';

class ApiProtoc {
  static Future<String?> Function()? getToken;
  static Map<String, String>? Function()? getHeaders;

  static Future<Uint8List> call($pb.GeneratedMessage message) async {
    String messageName = message.info_.messageName;
    if (messageName.endsWith('Request')) {
      messageName =
          messageName.substring(0, messageName.length - 'Request'.length);
    }
    Map<String, String>? headers;
    if (getHeaders != null) {
      headers = getHeaders!();
    }
    if (getToken != null) {
      final String? idToken = await getToken!();
      if (idToken != null) {
        headers = <String, String>{'Authorization': idToken};
      }
    }
    final int? api = ApiConfig.api;
    String path = '/$messageName';
    if (api != null) {
      path = '/$api$path';
    }
    return $http
        .post(
            Uri(
                scheme: ApiConfig.urlScheme,
                host: ApiConfig.ulrHost,
                port: ApiConfig.urlPort,
                path: path),
            headers: headers,
            body: message.writeToBuffer())
        .timeout(const Duration(seconds: 30))
        .then(($http.Response response) {
      final statusCode = response.statusCode;
      if (statusCode != 200) {
        throw ServerStatusException(
            path, statusCode, response.reasonPhrase, message.toDebugString());
      }
      return response.bodyBytes;
    });
  }
}
