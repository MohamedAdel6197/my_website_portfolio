import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../extensions.dart';
import '../style/app_colors.dart';
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
              Text("About Me", style: context.appTextStyles.titleLgBlod),
              const Gap(20),
              Text.rich(
                TextSpan(
                  style: context.appTextStyles.bodyLgMedium.copyWith(
                    height: 1.6,
                  ),
                  children: [
                    const TextSpan(text: "Dedicated "),
                    TextSpan(
                      text: "Flutter developer",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: " with "),
                    TextSpan(
                      text: "+ 2 years of experience",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text:
                          " in building high-performance, user-friendly mobile apps. Skilled in writing clean, maintainable code, collaborating effectively within teams, and using AI tools to enhance development workflows and optimize user experience.",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
