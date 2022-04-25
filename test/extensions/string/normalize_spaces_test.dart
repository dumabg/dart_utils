import 'package:test/test.dart';

import 'package:dart_utils/extensions/string/normalize_spaces.dart';

void main() {
  test('String normalizeSpaces extension', () {
    var cad = '  Hello  world ';
    expect(cad.normalizeSpaces(), 'Hello world');
  });
}
