import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../extensions.dart';
import '../models/portfolio_data.dart';
import '../style/app_size.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.colorScheme.surfaceContainerHighest.withOpacity(0.3),
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
              Text(
                PortfolioData.objective,
                style: context.appTextStyles.bodyLgMedium.copyWith(height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
