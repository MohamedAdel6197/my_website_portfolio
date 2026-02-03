import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../extensions.dart';
import '../models/portfolio_data.dart';
import '../style/app_colors.dart';
import '../style/app_size.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
        border: Border.all(
          color: context.colorScheme.outline.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryColor.withValues(
              alpha: 0.05,
            ), // Using secondary color for projects
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  project.name,
                  style: context.appTextStyles.titleMdMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ),
              if (project.link != null)
                IconButton(
                  onPressed: () => _launchUrl(project.link!),
                  icon: Icon(
                    Icons.arrow_outward,
                    size: 20,
                    color: AppColors.secondaryColor,
                  ),
                  tooltip: "View Project",
                ),
            ],
          ),
          const Gap(8),
          const Gap(8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Builder(
              builder: (context) {
                final parts = project.platforms.split(' - ');
                return RichText(
                  text: TextSpan(
                    children: parts.asMap().entries.map((entry) {
                      final int idx = entry.key;
                      final String part = entry.value.trim();

                      String? url;
                      if (part.contains('Play Store') ||
                          part.contains('Google Play')) {
                        url = project.playStoreLink;
                      } else if (part.contains('App Store')) {
                        url = project.appStoreLink;
                      } else if (part.contains('Web')) {
                        url = project.link;
                      } else if (part.contains('Demo')) {
                        url = project.demoLink;
                      }

                      return TextSpan(
                        children: [
                          TextSpan(
                            text: part,
                            style: context.appTextStyles.bodyMdMedium.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              decoration: url != null
                                  ? TextDecoration.underline
                                  : null,
                              decorationColor: AppColors.primaryColor
                                  .withValues(alpha: 0.5),
                            ),
                            recognizer: url != null
                                ? (TapGestureRecognizer()
                                    ..onTap = () => _launchUrl(url!))
                                : null,
                          ),
                          if (idx < parts.length - 1)
                            TextSpan(
                              text: " - ",
                              style: context.appTextStyles.bodyMdMedium
                                  .copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                            ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
          const Gap(16),
          Text(
            project.description,
            style: context.appTextStyles.bodyLgMedium.copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: 0.8),
              height: 1.5,
            ),
          ),
          const Gap(20),
          Divider(
            color: context.colorScheme.outlineVariant.withValues(alpha: 0.3),
          ),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                project.period,
                style: context.appTextStyles.bodyMdMedium.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Row(
                children: [
                  if (project.playStoreLink != null) ...[
                    IconButton(
                      onPressed: () => _launchUrl(project.playStoreLink!),
                      icon: const FaIcon(FontAwesomeIcons.googlePlay, size: 20),
                      color: context.colorScheme.onSurface,
                      tooltip: "Google Play",
                    ),
                  ],
                  if (project.appStoreLink != null) ...[
                    IconButton(
                      onPressed: () => _launchUrl(project.appStoreLink!),
                      icon: const FaIcon(FontAwesomeIcons.appStore, size: 22),
                      color: context.colorScheme.onSurface,
                      tooltip: "App Store",
                    ),
                  ],
                  if (project.demoLink != null) ...[
                    IconButton(
                      onPressed: () => _launchUrl(project.demoLink!),
                      icon: const FaIcon(
                        FontAwesomeIcons.mobileScreen,
                        size: 20,
                      ),
                      color: context.colorScheme.onSurface,
                      tooltip: "Live Demo",
                    ),
                  ],
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
