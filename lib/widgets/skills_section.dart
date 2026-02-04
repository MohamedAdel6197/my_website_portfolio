import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../extensions.dart';
import '../locale_keys.dart';
import '../models/portfolio_data.dart';
import '../style/app_colors.dart';
import '../style/app_size.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                LocaleKeys.skillsTechnicalBackground,
                style: context.appTextStyles.titleLgBlod,
              ),
              const Gap(30),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = context.isDesktop(context);
                  if (isDesktop) {
                    return Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: PortfolioData.skills
                          .map(
                            (category) => SizedBox(
                              width: (constraints.maxWidth - 24) / 2,
                              child: _SkillCategoryCard(category),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Column(
                      children: PortfolioData.skills
                          .map((category) => _SkillCategoryCard(category))
                          .toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillCategoryCard extends StatelessWidget {
  final SkillCategory category;
  const _SkillCategoryCard(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colorScheme.outline.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryColor.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category.title,
            style: context.appTextStyles.titleMdMedium.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.primaryColor,
            ),
          ),
          const Gap(16),
          Divider(
            color: context.colorScheme.outlineVariant.withValues(alpha: 0.3),
          ),
          const Gap(16),
          ...category.skills.map(
            (skill) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 18,
                    color: AppColors.secondaryColor,
                  ),
                  const Gap(12),
                  Expanded(
                    child: Text(
                      skill,
                      style: context.appTextStyles.bodyLgMedium.copyWith(
                        color: context.colorScheme.onSurface.withValues(
                          alpha: 0.8,
                        ),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
