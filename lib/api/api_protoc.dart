import 'dart:typed_data';
import 'api_config.dart';
import 'server_status_exception.dart';
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:http/http.dart' as $http;
//import 'package:http2/transport.dart';
//import 'dart:io';

class ApiProtoc {
  static Future<String?> Function()? getToken;

  static Future<Uint8List> call($pb.GeneratedMessage message) async {
    String messageName = message.info_.messageName;
    if (messageName.endsWith("Request")) {
      messageName =
          messageName.substring(0, messageName.length - "Request".length);
    }
    Map<String, String>? headers;
    if (getToken != null) {
      String? idToken = await getToken!();
      if (idToken != null) {
        headers = <String, String>{'Authorization': idToken};
      }
    }
    int? api = ApiConfig.api;
    String path = '/$messageName';
    if (api != null) {
      path = '/$api$path';
    }
    //   return await _http2(headers, message, path);
    // }

    // static Future<Uint8List> _http2(Map<String, String>? headers,
    //     $pb.GeneratedMessage message, String path) async {
    //   String urlScheme = ApiConfig.urlScheme;
    //   bool useSSL = urlScheme == 'https';
    //   String ulrHost = ApiConfig.ulrHost;
    //   Socket socket;
    //   if (useSSL) {
    //     socket = await SecureSocket.connect(ulrHost, ApiConfig.urlPort,
    //         supportedProtocols: ['h2']);
    //     if ((socket as SecureSocket).selectedProtocol != 'h2') {
    //       throw Exception('Failed to negogiate http/2 via alpn. Maybe server '
    //           "doesn't support http/2.");
    //     }
    //   } else {
    //     socket = await Socket.connect(ulrHost, ApiConfig.urlPort);
    //   }
    //   socket.add(message.writeToBuffer());

    //   ClientTransportConnection transport =
    //       ClientTransportConnection.viaSocket(socket);
    //   List<Header> headers = [
    //     Header.ascii(':method', 'POST'),
    //     Header.ascii(':path', path),
    //     Header.ascii(':scheme', urlScheme),
    //     Header.ascii(':authority', ulrHost),
    //   ];

    //   ClientTransportStream stream =
    //       transport.makeRequest(headers, endStream: true);

    //   List<int>? data;
    //   await for (StreamMessage message in stream.incomingMessages) {
    //     if (message is HeadersStreamMessage) {
    //       // for (Header header in message.headers) {
    //       //   var name = utf8.decode(header.name);
    //       //   var value = utf8.decode(header.value);
    //       //   print('$name: $value');
    //       // }
    //     } else if (message is DataStreamMessage) {
    //       // Use [message.bytes] (but respect 'content-encoding' header)
    //       data = message.bytes;
    //     }
    //   }
    //   await transport.finish();
    //   return Uint8List.fromList(data ?? List.empty());
    // }

    // static Uint8List _http(Map<String, String>? headers,
    //     $pb.GeneratedMessage message, String path) {
    return $http
        .post(
            Uri(
                scheme: ApiConfig.urlScheme,
                host: ApiConfig.ulrHost,
                port: ApiConfig.urlPort,
                path: path),
            headers: headers,
            body: message.writeToBuffer())
        .timeout(const Duration(seconds: 15))
        .then(($http.Response response) {
      var statusCode = response.statusCode;
      if (statusCode != 200) {
        throw ServerStatusException(statusCode, response.reasonPhrase);
      }
      return response.bodyBytes;
    });
  }
}
