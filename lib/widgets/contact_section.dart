import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../extensions.dart';
import '../locale_keys.dart';
import '../models/portfolio_data.dart';
import '../style/app_size.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
      color: Colors.black, // Darker footer
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: context.insets.sectionPadding,
        horizontal: context.insets.padding,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: Insets.maxWidth),
          child: Column(
            children: [
              Text(
                LocaleKeys.getInTouch,
                style: context.appTextStyles.titleLgBlod.copyWith(
                  color: Colors.white,
                ),
              ),
              const Gap(30),
              Text(
                PortfolioData.email,
                style: context.appTextStyles.titleMdMedium.copyWith(
                  color: Colors.white70,
                ),
              ),
              const Gap(10),
              Text(
                PortfolioData.phone,
                style: context.appTextStyles.titleMdMedium.copyWith(
                  color: Colors.white70,
                ),
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => _launchUrl(PortfolioData.githubUrl),
                    icon: const Icon(
                      FontAwesomeIcons.github,
                      color: Colors.white,
                    ),
                    tooltip: LocaleKeys.github,
                  ),
                  const Gap(20),
                  IconButton(
                    onPressed: () => _launchUrl(PortfolioData.linkedinUrl),
                    icon: const Icon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.white,
                    ),
                    tooltip: LocaleKeys.linkedIn,
                  ),
                ],
              ),
              const Gap(40),
              Text(
                "© ${DateTime.now().year} ${PortfolioData.name}. ${LocaleKeys.copyright}",
                style: context.appTextStyles.bodyMdMedium.copyWith(
                  color: Colors.white38,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
