extension RemoveChars on String {
  String removeChars(String chars) {
    var result = StringBuffer();
    for (int i = 0; i < length; i++) {
      var c = this[i];
      if (chars.indexOf(c) == -1) {
        result.write(c);
      }
    }
    return result.toString();
  }

  String removeWhiteSpace() {
    if (this.length <= 0) return '';
    return this.trim().replaceAll(RegExp(r'\s+'), '');
  }

  String removeSpecialChars() {
    return this.replaceAll(RegExp(r'[^a-zA-Z 0-9]+'), '');
  }
}
