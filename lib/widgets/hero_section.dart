import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../extensions.dart';
import '../locale_keys.dart';
import '../models/portfolio_data.dart';
import '../style/app_colors.dart';
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final imagePath = 'assets/images/mhmd.jpg';

    return Container(
      width: 320,
      height: 320,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: isDark ? AppColors.accentGradient : AppColors.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.4),
            blurRadius: 30,
            spreadRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(4), // Border width
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.primaryColor.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.waving_hand, color: Colors.amber),
              const Gap(10),
              Text(
                LocaleKeys.salutIm,
                style: context.appTextStyles.titleMdMedium.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const Gap(15),
        ShaderMask(
          shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
            LocaleKeys.name,
            textAlign: context.isDesktop(context)
                ? TextAlign.start
                : TextAlign.center,
            style: context.appTextStyles.titleLgBlod.copyWith(
              fontSize: context.isMobile(context) ? 48 : 72,
              height: 1.0,
              color: Colors.white, // Required for ShaderMask
            ),
          ),
        ),
        const Gap(10),
        Text(
          LocaleKeys.title,
          style: context.appTextStyles.titleMdMedium.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.8),
            fontSize: 26,
            fontWeight: FontWeight.w300,
          ),
        ),
        const Gap(30),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          alignment: context.isDesktop(context)
              ? WrapAlignment.start
              : WrapAlignment.center,
          children: [
            _ContactChip(
              icon: Icons.email_outlined,
              label: LocaleKeys.emailMe,
              onTap: () => _launchUrl("mailto:${PortfolioData.email}"),
              isPrimary: true,
            ),
            _ContactChip(
              icon: FontAwesomeIcons.linkedin,
              label: LocaleKeys.linkedIn,
              onTap: () => _launchUrl(PortfolioData.linkedinUrl),
            ),
            _ContactChip(
              icon: FontAwesomeIcons.github,
              label: LocaleKeys.github,
              onTap: () => _launchUrl(PortfolioData.githubUrl),
            ),
          ],
        ),
        const Gap(30),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_on_outlined, color: AppColors.secondaryColor),
              const Gap(8),
              Text(
                LocaleKeys.location,
                style: context.appTextStyles.bodyMdMedium.copyWith(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
        const Gap(30),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.phone, color: AppColors.primaryColor),
              const Gap(8),
              Text(
                PortfolioData.phone,
                style: context.appTextStyles.bodyMdMedium.copyWith(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
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
  final bool isPrimary;

  const _ContactChip({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          gradient: isPrimary ? AppColors.primaryGradient : null,
          color: isPrimary ? null : context.colorScheme.surface,
          border: isPrimary
              ? null
              : Border.all(
                  color: context.colorScheme.outline.withValues(alpha: 0.3),
                ),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            if (isPrimary)
              BoxShadow(
                color: AppColors.primaryColor.withValues(alpha: 0.3),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isPrimary ? Colors.white : context.colorScheme.onSurface,
            ),
            const Gap(10),
            Text(
              label,
              style: context.appTextStyles.bodyMdMedium.copyWith(
                color: isPrimary ? Colors.white : context.colorScheme.onSurface,
                fontWeight: isPrimary ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
