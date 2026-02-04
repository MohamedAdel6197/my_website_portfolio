import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../extensions.dart';
import '../locale_keys.dart';
import '../style/app_size.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
      padding: EdgeInsets.symmetric(
        vertical: context.insets.sectionPadding,
        horizontal: context.insets.padding,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: Insets.maxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.aboutMe,
                style: context.appTextStyles.titleLgBlod,
              ),
              const Gap(20),
              Text.rich(
                TextSpan(
                  style: context.appTextStyles.bodyLgMedium.copyWith(
                    height: 1.6,
                  ),
                  children: LocaleKeys.objective.split('*').asMap().entries.map(
                    (entry) {
                      final isHighlight = entry.key % 2 != 0;
                      return TextSpan(
                        text: entry.value,
                        style: isHighlight
                            ? TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )
                            : null,
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
