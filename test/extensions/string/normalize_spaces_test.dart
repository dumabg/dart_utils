import 'package:dart_utils/extensions/string/normalize_spaces.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('String normalizeSpaces extension', () {
    const String cad = '  Hello  world ';
    expect(cad.normalizeSpaces(), 'Hello world');
  });
}
