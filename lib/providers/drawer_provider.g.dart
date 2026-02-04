// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DrawerState)
final drawerStateProvider = DrawerStateProvider._();

final class DrawerStateProvider extends $NotifierProvider<DrawerState, bool> {
  DrawerStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'drawerStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$drawerStateHash();

  @$internal
  @override
  DrawerState create() => DrawerState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$drawerStateHash() => r'1a7ea4d4c05c60710226484c362895e6f383aa2c';

abstract class _$DrawerState extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
