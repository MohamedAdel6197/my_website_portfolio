import 'package:flutter/material.dart';

import 'widgets/about_section.dart';
import 'widgets/animated_starfield.dart';
import 'widgets/app_bar/my_app_bar.dart';
import 'widgets/app_drawer.dart';
import 'widgets/contact_section.dart';
import 'widgets/courses_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/skills_section.dart'; // Added this import

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: MyAppBar(),
        body: AnimatedStarfield(
          starCount: 100,
          minStarSize: 0.25,
          maxStarSize: 1.0,
          starColor: isDark
              ? Colors.white
              : Colors.white.withValues(alpha: 0.6),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeroSection(),
                AboutSection(),
                ExperienceSection(),
                ProjectsSection(),
                CoursesSection(),
                SkillsSection(),
                ContactSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
