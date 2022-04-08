import 'package:test/test.dart';

import 'package:dart_utils/extensions/string/normalize_spaces.dart';

void main() {
  test('Normalize spaces String extension', () {
    var cad = '  Hello  world ';
    expect(cad.normalizeSpaces(), 'Hello world');
  });
}
