import 'package:flutter/material.dart';

import 'widgets/about_section.dart';
import 'widgets/app_bar/my_app_bar.dart';
import 'widgets/app_drawer.dart';
import 'widgets/contact_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/projects_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeroSection(),
              AboutSection(),
              ExperienceSection(),
              ProjectsSection(),
              ContactSection(),
            ],
          ),
        ),
      ),
    );
  }
}
