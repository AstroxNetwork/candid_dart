import 'dart:async';

extension NumExtension<T extends num> on T {
  T coerceAtLeast(T minimumValue) {
    return this < minimumValue ? minimumValue : this;
  }

  T coerceAtMost(T maximumValue) {
    return this > maximumValue ? maximumValue : this;
  }

  String get formatFileSize {
    const int KB = 1024;
    const int MB = 1024 * KB;
    const int GB = 1024 * MB;
    if (this >= GB) {
      return '${(this / GB).toStringAsFixed(2)} GB';
    }
    if (this >= MB) {
      return '${(this / MB).toStringAsFixed(2)} MB';
    }
    if (this >= KB) {
      return '${(this / KB).toStringAsFixed(2)} KB';
    }
    return '$this B';
  }
}

extension FutureOrExtension<T> on Iterable<FutureOr<T>> {
  Future<List<T>> waitOr({
    bool eagerError = false,
    void Function(T successValue)? cleanUp,
  }) {
    return Future.wait(
      map((e) => e is Future<T> ? e : Future.value(e)),
      eagerError: eagerError,
      cleanUp: cleanUp,
    );
  }
}

extension IterableFuture<T> on Iterable<Future<T>> {
  Future<List<T>> wait({
    bool eagerError = false,
    void Function(T successValue)? cleanUp,
  }) {
    return Future.wait(this, eagerError: eagerError, cleanUp: cleanUp);
  }
}
