extension OnlyNumbersAndLetters on String {
  // ignore: non_constant_identifier_names
  static final codeUnit_a = 'a'.codeUnitAt(0);
  // ignore: non_constant_identifier_names
  static final codeUnit_z = 'z'.codeUnitAt(0);
  // ignore: non_constant_identifier_names
  static final codeUnit_A = 'A'.codeUnitAt(0);
  // ignore: non_constant_identifier_names
  static final codeUnit_Z = 'Z'.codeUnitAt(0);
  static final codeUnit_0 = '0'.codeUnitAt(0);
  static final codeUnit_9 = '9'.codeUnitAt(0);
  // ignore: non_constant_identifier_names
  static final codeUnit_Space = ' '.codeUnitAt(0);

  String onlyNumbersAndLetters() {
    var result = '';
    for (int i = 0; i < length; i++) {
      final c = codeUnitAt(i);
      if (((c >= codeUnit_a) && (c <= codeUnit_z)) ||
          ((c >= codeUnit_A) && (c <= codeUnit_Z)) ||
          ((c >= codeUnit_0) && (c <= codeUnit_9))) {
        result = result + this[i];
      }
    }
    return result;
  }

  String onlyNumbersLettersAndSpaces({bool normalizeSpaces = false}) {
    final result = StringBuffer();
    bool inSpace = false;
    for (int i = 0; i < length; i++) {
      final c = codeUnitAt(i);
      if (((c >= codeUnit_a) && (c <= codeUnit_z)) ||
          ((c >= codeUnit_A) && (c <= codeUnit_Z)) ||
          ((c >= codeUnit_0) && (c <= codeUnit_9))) {
        result.writeCharCode(c);
      } else {
        if (c == codeUnit_Space) {
          if (normalizeSpaces) {
            if (!inSpace) {
              result.writeCharCode(c);
              inSpace = true;
            }
          } else {
            result.writeCharCode(c);
          }
        } else {
          inSpace = false;
        }
      }
    }
    return result.toString();
  }
}
