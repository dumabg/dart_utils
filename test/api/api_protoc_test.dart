import 'dart:io';

import 'package:dart_utils/api/api_config.dart';
import 'package:dart_utils/api/api_protoc.dart';
import 'package:dart_utils/api/server_status_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mock_http/mock_http.dart';
import 'game_points_request.pb.dart';

void main() {
  test('ApiProtoc ServerStatusException', () async {
    final request = GamePointsRequest(
        experienceId: 'TestId', points: 100, alwaysRateRanking: false);
    try {
      ApiConfig.init('http', 'localhost', 1000, 1);
      HttpOverrides.global = MockHttp(
        defaultScheme: ApiConfig.urlScheme,
        defaultHost: ApiConfig.ulrHost,
        defaultPort: ApiConfig.urlPort,
      )..registerPosts(pathResponses: {
          '/1/GamePoints': (_) => Response.bytes(
              GamePointsResponse(position: 1).writeToBuffer().toList(),
              HttpStatus.badRequest),
        });
      await ApiProtoc.call(request);
    } catch (e) {
      if (e is ServerStatusException) {
        expect(e.toString(), '''ServerStatusException: 400 Bad Request
/1/GamePoints
experienceId: TestId
points: 100
alwaysRateRanking: false
''');
      } else {
        rethrow;
      }
    }
  });
}
