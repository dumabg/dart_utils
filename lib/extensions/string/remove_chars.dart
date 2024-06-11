extension RemoveChars on String {
  String removeChars(String chars) {
    final result = StringBuffer();
    for (int i = 0; i < length; i++) {
      final c = this[i];
      if (!chars.contains(c)) {
        result.write(c);
      }
    }
    return result.toString();
  }

  String removeWhiteSpace() {
    if (length <= 0) {
      return '';
    }
    return trim().replaceAll(RegExp(r'\s+'), '');
  }

  String removeSpecialChars() {
    return replaceAll(RegExp('[^a-zA-Z 0-9]+'), '');
  }
}
