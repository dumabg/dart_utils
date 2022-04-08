extension Capitalize on String {
  String get capitalizeFirst => '${this[0].toUpperCase()}${substring(1)}';
  String get capitalizeFirstofEach =>
      split(' ').map((str) => str.capitalizeFirst).join(' ');
}
