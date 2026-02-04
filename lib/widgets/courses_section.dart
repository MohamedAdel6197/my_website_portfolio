import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../extensions.dart';
import '../locale_keys.dart';
import '../models/portfolio_data.dart';
import '../style/app_colors.dart';
import '../style/app_size.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

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
                LocaleKeys.courses,
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
                      children: PortfolioData.courses
                          .map(
                            (c) => SizedBox(
                              width: (constraints.maxWidth - 24) / 2,
                              child: _CourseCard(c),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Column(
                      children: PortfolioData.courses
                          .map((c) => _CourseCard(c))
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

class _CourseCard extends StatelessWidget {
  final Course course;
  const _CourseCard(this.course);

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
              Expanded(
                child: Text(
                  course.title,
                  style: context.appTextStyles.titleMdMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ),
              if (isDesktop) ...[
                const Gap(16),
                _DateBadge(date: course.period),
              ],
            ],
          ),
          if (!isDesktop) ...[const Gap(12), _DateBadge(date: course.period)],
          const Gap(16),
          Divider(
            color: context.colorScheme.outlineVariant.withValues(alpha: 0.3),
          ),
          const Gap(16),
          Row(
            children: [
              Icon(
                Icons.person_outline,
                size: 18,
                color: context.colorScheme.onSurfaceVariant,
              ),
              const Gap(8),
              Text(
                "${LocaleKeys.instructor} : ",
                style: context.appTextStyles.bodyMdMedium.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Text(
                  course.instructor,
                  style: context.appTextStyles.bodyMdMedium.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
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
                course.location,
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
