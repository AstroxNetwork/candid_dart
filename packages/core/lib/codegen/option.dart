class GenOption {
  const GenOption({
    this.freezed = false,
    this.makeCollectionsUnmodifiable = true,
    this.equal = true,
    this.copyWith = true,
    this.service = false,
    this.explicitSerializationMethods = false,
    this.injectPackages,
    this.preActorCall,
    this.postActorCall,
  });

  factory GenOption.fromJson(Map<String, dynamic> json) {
    final injectPackages = json['inject_packages'];
    final preActorCall = json['pre_actor_call'];
    final postActorCall = json['post_actor_call'];
    return GenOption(
      freezed: json['freezed'] ?? false,
      equal: json['equal'] ?? true,
      copyWith: json['copy_with'] ?? true,
      service: json['service'] ?? false,
      preActorCall: preActorCall,
      postActorCall: postActorCall,
      injectPackages: injectPackages is List ? injectPackages.cast() : null,
      makeCollectionsUnmodifiable:
          json['make_collections_unmodifiable'] ?? true,
      explicitSerializationMethods:
          json['explicit_serialization_methods'] ?? false,
    );
  }

  final bool freezed;

  final bool makeCollectionsUnmodifiable;

  final bool equal;

  final bool copyWith;

  final bool service;

  final bool explicitSerializationMethods;

  final List<String>? injectPackages;
  final String? preActorCall;
  final String? postActorCall;

  Map<String, Object?> toJson() {
    return {
      'freezed': freezed,
      'makeCollectionsUnmodifiable': makeCollectionsUnmodifiable,
      'equal': equal,
      'copyWith': copyWith,
      'service': service,
      'explicitSerializationMethods': explicitSerializationMethods,
      'injectPackages': injectPackages,
      'preActorCall': preActorCall,
      'postActorCall': postActorCall,
    };
  }

  @override
  String toString() {
    return 'GenOption(${toJson()})';
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
