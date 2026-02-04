import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_section_provider.g.dart';

@riverpod
class CurrentSection extends _$CurrentSection {
  @override
  String build() => 'about';

  void updateSection(String section) {
    state = section;
  }
}
