extension MapWithIndex<T> on List<T> {
  List<R> mapWithIndex<R>(R Function(T, int i) callback) {
    final List<R> result = [];
    for (int i = 0; i < length; i++) {
      final R item = callback(this[i], i);
      result.add(item);
    }
    return result;
  }
}
