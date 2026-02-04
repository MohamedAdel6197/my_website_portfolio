// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_section_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentSection)
final currentSectionProvider = CurrentSectionProvider._();

final class CurrentSectionProvider
    extends $NotifierProvider<CurrentSection, String> {
  CurrentSectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentSectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentSectionHash();

  @$internal
  @override
  CurrentSection create() => CurrentSection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$currentSectionHash() => r'7e757c5ea027a513cae1a1692b6e84e1f2ec777e';

abstract class _$CurrentSection extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
