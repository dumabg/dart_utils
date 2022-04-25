import 'dart:io';

extension Source on StackTrace {
  File source() {
    final String stack = toString();
    // Example: (file:///D/Projectes/Tantenc/dev/app/app/src/test/screen/main/main_screen_test.dart:27:9)
    final String pattern = '(file://';
    final int iStart = stack.indexOf(pattern);
    int iEnd = stack.indexOf(')', iStart);
    iEnd = stack.lastIndexOf(':', iEnd);
    iEnd = stack.lastIndexOf(':', iEnd - 1);
    final String fileName = stack.substring(iStart + pattern.length, iEnd);
    return File(fileName);
  }
}