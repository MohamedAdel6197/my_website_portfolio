import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../extensions.dart';
import '../locale_keys.dart';
import '../models/portfolio_data.dart';
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
                            ? const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )
                            : null,
                      );
                    },
                  ).toList(),
                ),
              ),
              const Gap(40),
              Text(
                LocaleKeys.education,
                style: context.appTextStyles.titleMdMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                ),
              ),
              const Gap(20),
              ...PortfolioData.education.map((e) => _EducationCard(e)),
              const Gap(30),
              Text(
                LocaleKeys.militaryService,
                style: context.appTextStyles.titleMdMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                ),
              ),
              const Gap(10),
              Text(
                PortfolioData.militaryService,
                style: context.appTextStyles.bodyLgMedium.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  final Education education;
  const _EducationCard(this.education);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Image.asset(
            "assets/images/aast-logo.png",
            height: 100,
            fit: BoxFit.cover,
          ),
          const Gap(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  education.degree,
                  style: context.appTextStyles.titleMdMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Gap(4),
                Text(
                  education.institution,
                  style: context.appTextStyles.bodyLgMedium,
                ),
                const Gap(8),
                Text(
                  "${LocaleKeys.gradeLabel}: ${education.grade}",
                  style: context.appTextStyles.bodyMdMedium.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                const Gap(8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondaryContainer.withValues(
                      alpha: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${LocaleKeys.graduationProjectLabel}: ${education.graduationProject}",
                        style: context.appTextStyles.bodyMdMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${LocaleKeys.gradeLabel}: ${education.graduationProjectGrade}",
                        style: context.appTextStyles.bodyMdMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
