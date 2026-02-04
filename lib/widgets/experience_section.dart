import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../extensions.dart';
import '../locale_keys.dart';
import '../models/portfolio_data.dart';
import '../style/app_colors.dart';
import '../style/app_size.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                LocaleKeys.professionalExperience,
                style: context.appTextStyles.titleLgBlod,
              ),
              const Gap(30),
              Column(
                children: PortfolioData.experience
                    .map((e) => _ExperienceCard(e))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final Experience experience;
  const _ExperienceCard(this.experience);

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colorScheme.outline.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.darkBackgroundColor,
                  image: DecorationImage(
                    image: AssetImage(experience.companyImage),
                    fit: BoxFit.contain,
                  ),
                  border: Border.all(
                    color: context.colorScheme.outline.withValues(alpha: 0.4),
                  ),
                ),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      experience.role,
                      style: context.appTextStyles.titleMdMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                    const Gap(8),
                    Row(
                      children: [
                        Text(
                          experience.company,
                          style: context.appTextStyles.titleSmBold.copyWith(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (isDesktop) ...[
                const Gap(16),
                _DateBadge(date: experience.period),
              ],
            ],
          ),
          if (!isDesktop) ...[
            const Gap(12),
            _DateBadge(date: experience.period),
          ],
          const Gap(16),
          Divider(
            color: context.colorScheme.outlineVariant.withValues(alpha: 0.3),
          ),
          const Gap(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.description_outlined,
                size: 18,
                color: context.colorScheme.onSurfaceVariant,
              ),
              const Gap(8),
              Expanded(
                child: Text(
                  experience.description,
                  style: context.appTextStyles.bodyLgMedium.copyWith(
                    color: context.colorScheme.onSurface.withValues(alpha: 0.8),
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
          const Gap(10),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 18,
                color: context.colorScheme.onSurfaceVariant,
              ),
              const Gap(8),
              Text(
                experience.location,
                style: context.appTextStyles.bodyMdMedium.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DateBadge extends StatelessWidget {
  final String date;
  const _DateBadge({required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.secondaryColor.withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        date,
        style: context.appTextStyles.bodyMdMedium.copyWith(
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
