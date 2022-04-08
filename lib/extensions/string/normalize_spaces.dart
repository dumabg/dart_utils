extension NormalizeSpaces on String {
  String normalizeSpaces() {
    int i = 0;
    while ((i < length) && (this[i] == ' ')) {
      i++;
    }
    var result = StringBuffer();
    while (i < length) {
      String c = this[i];
      if (c == ' ') {
        while ((i < length) && (this[i] == ' ')) {
          i++;
        }
        if (i < length) {
          result.write(' ');
        }
      } else {
        result.write(c);
        i++;
      }
    }
    return result.toString();
  }
}
