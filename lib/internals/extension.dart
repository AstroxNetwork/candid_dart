extension IterableExt<T> on Iterable<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isSafeNotEmpty => !isNullOrEmpty;

  T? getOrNull(final int index) {
    if (isNullOrEmpty) return null;
    return this!.elementAt(index);
  }

  bool eq(Iterable<T>? other) {
    if (this == null) return other == null;
    if (other == null || this!.length != other.length) return false;
    for (int index = 0; index < this!.length; index += 1) {
      if (this!.elementAt(index) != other.elementAt(index)) return false;
    }
    return true;
  }

  bool ne(Iterable<T> other) => !eq(other);
}

extension BoolExt on bool {
  bool get inv => !this;
}

extension ListExt<T> on List<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isSafeNotEmpty => !isNullOrEmpty;

  T? getOrNull(final int index) {
    if (isNullOrEmpty) return null;
    return this![index];
  }

  bool eq(List<T>? other) {
    if (this == null) return other == null;
    if (other == null || this!.length != other.length) return false;
    for (int index = 0; index < this!.length; index += 1) {
      if (this![index] != other[index]) return false;
    }
    return true;
  }

  bool ne(List<T>? other) => !eq(other);
}

extension MapExt<K, V> on Map<K, V>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isSafeNotEmpty => !isNullOrEmpty;

  bool eq(Map<K, V>? other) {
    if (this == null) return other == null;
    if (other == null || this!.length != other.length) return false;
    for (final K key in this!.keys) {
      if (!other.containsKey(key) || other[key] != this![key]) {
        return false;
      }
    }
    return true;
  }

  bool ne(Map<K, V>? other) => !eq(other);
}

extension NullableStringExt on String? {
  bool get isNullOrBlank => this == null || this!.isBlank;

  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotBlank => this != null && !this!.isBlank;
}

extension StringExt on String {
  bool get isBlank {
    if (length == 0) {
      return true;
    }
    for (int value in runes) {
      if (!_isWhitespace(value)) {
        return false;
      }
    }
    return true;
  }

  bool _isWhitespace(int rune) =>
      (rune >= 0x0009 && rune <= 0x000D) ||
      rune == 0x0020 ||
      rune == 0x0085 ||
      rune == 0x00A0 ||
      rune == 0x1680 ||
      rune == 0x180E ||
      (rune >= 0x2000 && rune <= 0x200A) ||
      rune == 0x2028 ||
      rune == 0x2029 ||
      rune == 0x202F ||
      rune == 0x205F ||
      rune == 0x3000 ||
      rune == 0xFEFF;

  String fillChar(String value, String char) {
    int offset = value.length - length;
    String newVal = this;
    if (offset > 0) {
      for (int i = 0; i < offset; i++) {
        newVal = char + newVal;
      }
    }
    return newVal;
  }
}
