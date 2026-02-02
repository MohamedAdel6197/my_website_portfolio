import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../extensions.dart';
import '../models/portfolio_data.dart';
import '../style/app_size.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.insets.sectionPadding,
        horizontal: context.insets.padding,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Insets.maxWidth),
        child: context.isDesktop(context)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: const _HeroContent()),
                  const Gap(40),
                  const _HeroImage(),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const _HeroImage(),
                  const Gap(40),
                  const _HeroContent(),
                ],
              ),
      ),
    );
  }
}

class _HeroImage extends StatelessWidget {
  const _HeroImage();

  @override
  Widget build(BuildContext context) {
    // Check if the current theme is dark
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final imagePath = isDark
        ? 'assets/images/dark_mode.png'
        : 'assets/images/light_mode.png';

    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(
          color: context.colorScheme.primary.withOpacity(0.5),
          width: 4,
        ),
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent();

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
    return Column(
      crossAxisAlignment: context.isDesktop(context)
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          "Salut, I'm",
          style: context.appTextStyles.titleMdMedium.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
        const Gap(10),
        Text(
          PortfolioData.name,
          textAlign: context.isDesktop(context)
              ? TextAlign.start
              : TextAlign.center,
          style: context.appTextStyles.titleLgBlod.copyWith(
            fontSize: context.isMobile(context) ? 40 : 64,
            height: 1.1,
          ),
        ),
        const Gap(10),
        Text(
          PortfolioData.title,
          style: context.appTextStyles.titleMdMedium.copyWith(
            color: context.colorScheme.onSurface.withOpacity(0.7),
            fontSize: 24,
          ),
        ),
        const Gap(30),
        Wrap(
          spacing: 20,
          runSpacing: 10,
          alignment: context.isDesktop(context)
              ? WrapAlignment.start
              : WrapAlignment.center,
          children: [
            _ContactChip(
              icon: Icons.email_outlined,
              label: PortfolioData.email,
              onTap: () => _launchUrl("mailto:${PortfolioData.email}"),
            ),
            _ContactChip(
              icon: FontAwesomeIcons.linkedin,
              label: "LinkedIn",
              onTap: () => _launchUrl(PortfolioData.linkedinUrl),
            ),
            _ContactChip(
              icon: FontAwesomeIcons.github,
              label: "GitHub",
              onTap: () => _launchUrl(PortfolioData.githubUrl),
            ),
          ],
        ),
        const Gap(20),
        Text(
          "${PortfolioData.location} • ${PortfolioData.phone}",
          style: context.appTextStyles.bodyMdMedium.copyWith(
            color: context.colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}

class _ContactChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ContactChip({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: context.colorScheme.outline),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: context.colorScheme.onSurface),
            const Gap(8),
            Text(label, style: context.appTextStyles.bodyMdMedium),
          ],
        ),
      ),
    );
  }
}
