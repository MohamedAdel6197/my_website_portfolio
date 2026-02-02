import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../extensions.dart';
import '../models/portfolio_data.dart';
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
                "Professional Experience",
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
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      experience.role,
                      style: context.appTextStyles.titleMdMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      experience.company,
                      style: context.appTextStyles.titleSmBold.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              if (isDesktop) ...[
                const Gap(16),
                Text(
                  experience.period,
                  style: context.appTextStyles.bodyMdMedium.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
          if (!isDesktop) ...[
            const Gap(8),
            Text(
              experience.period,
              style: context.appTextStyles.bodyMdMedium.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          const Gap(8),
          Divider(color: context.colorScheme.outlineVariant.withOpacity(0.5)),
          const Gap(8),
          Text(
            "${experience.location} • ${experience.description}",
            style: context.appTextStyles.bodyLgMedium.copyWith(
              color: context.colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
