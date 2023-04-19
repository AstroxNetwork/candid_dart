class GenOption {

  const GenOption({
    this.freezed = false,
    this.makeCollectionsUnmodifiable = true,
    this.equal = true,
    this.copyWith = true,
  });

  factory GenOption.fromJson(Map<String, dynamic> json) {
    return GenOption(
      freezed: json['freezed'] ?? false,
      equal: json['equal'] ?? true,
      copyWith: json['copy_with'] ?? true,
      makeCollectionsUnmodifiable:
          json['make_collections_unmodifiable'] ?? true,
    );
  }
  final bool freezed;

  final bool makeCollectionsUnmodifiable;

  final bool equal;

  final bool copyWith;

  @override
  String toString() {
    return 'freezed: $freezed | makeCollectionsUnmodifiable: $makeCollectionsUnmodifiable | equal: $equal | copyWith: $copyWith';
  }

  String get annotation {
    final sb = StringBuffer();
    if (!copyWith) {
      sb.write('copyWith: false,');
    }
    if (!equal) {
      sb.write('equal: false,');
    }
    if (!makeCollectionsUnmodifiable) {
      sb.write('makeCollectionsUnmodifiable: false,');
    }
    if (sb.isEmpty) {
      return 'freezed';
    } else {
      return 'Freezed($sb)';
    }
  }
}
