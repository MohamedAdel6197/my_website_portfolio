import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../extensions.dart';
import '../models/portfolio_data.dart';
import '../style/app_size.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text("Projects", style: context.appTextStyles.titleLgBlod),
              const Gap(30),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = context.isDesktop(context);
                  // Simple responsive grid logic using Wrap or GridView
                  if (isDesktop) {
                    return Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: PortfolioData.projects
                          .map(
                            (p) => SizedBox(
                              width:
                                  (constraints.maxWidth - 24) / 2, // 2 columns
                              child: _ProjectCard(p),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Column(
                      children: PortfolioData.projects
                          .map(
                            (p) => Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: _ProjectCard(p),
                            ),
                          )
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

class _ProjectCard extends StatelessWidget {
  final Project project;
  const _ProjectCard(this.project);

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri)) {
        debugPrint('Could not launch $uri');
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.name,
            style: context.appTextStyles.titleMdMedium.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Gap(4),
          Text(
            project.platforms,
            style: context.appTextStyles.bodyMdMedium.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(12),
          Text(
            project.description,
            style: context.appTextStyles.bodyLgMedium.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(16),
          Text(
            project.period,
            style: context.appTextStyles.bodyMdMedium.copyWith(
              color: context.colorScheme.outline,
            ),
          ),
          if (project.link != null) ...[
            const Gap(16),
            OutlinedButton.icon(
              onPressed: () => _launchUrl(project.link!),
              icon: const Icon(Icons.open_in_new, size: 16),
              label: const Text("View Project"),
            ),
          ],
        ],
      ),
    );
  }
}
