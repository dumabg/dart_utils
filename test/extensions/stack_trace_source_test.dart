import 'dart:io';

import 'package:test/test.dart';
import 'package:dart_utils/extensions/stack_trace_source.dart';

class MockStackTrace extends StackTrace {
  @override
  String toString() {
    return '''
#0      fail (package:test_api/src/expect/expect.dart:137:31)
#1      _expect (package:test_api/src/expect/expect.dart:132:3)
#2      expect (package:test_api/src/expect/expect.dart:46:3)
#3      expect (package:flutter_test/src/widget_tester.dart:455:16)
#4      main.<anonymous closure>.<anonymous closure>.<anonymous closure> (file:///D/Projectes/Tantenc/dev/app/app/src/test/screen/main/main_screen_test.dart:27:9)
#5      main.<anonymous closure>.<anonymous closure>.<anonymous closure> (file:///D/Projectes/Tantenc/dev/app/app/src/test/screen/main/main_screen_test.dart:26:10)
#6      testScreen.<anonymous closure> (file:///D/Projectes/Tantenc/dev/app/app/src/test/screen_test.dart:101:25)
<asynchronous suspension>
#7      StackZoneSpecification._registerUnaryCallback.<anonymous closure> (package:stack_trace/src/stack_zone_specification.dart:125:47)
<asynchronous suspension>
''';
  }
}

void main() {
  test('StackTrace source extension', () {
    final stack = MockStackTrace();
    final File file = stack.source();
    expect(file.path,
        '/D/Projectes/Tantenc/dev/app/app/src/test/screen/main/main_screen_test.dart');
  });
}
