import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/current_section_provider.dart';
import 'providers/drawer_provider.dart';
import 'widgets/about_section.dart';
import 'widgets/animated_gradient_orbs.dart';
import 'widgets/app_bar/my_app_bar.dart';
import 'widgets/app_drawer.dart';
import 'widgets/contact_section.dart';
import 'widgets/courses_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/skills_section.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys for each section
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _coursesKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!mounted) return;
    final scrollPosition = _scrollController.position.pixels;
    final viewportHeight = _scrollController.position.viewportDimension;

    // Get positions of all sections
    final sections = {
      'hero': _heroKey,
      'about': _aboutKey,
      'experience': _experienceKey,
      'projects': _projectsKey,
      'courses': _coursesKey,
      'skills': _skillsKey,
      'contact': _contactKey,
    };

    String? currentSection;
    double minDistance = double.infinity;

    sections.forEach((sectionName, key) {
      final context = key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          final sectionTop = position.dy + scrollPosition;
          final sectionMiddle = sectionTop + (box.size.height / 2);

          // Calculate distance from viewport middle
          final viewportMiddle = scrollPosition + (viewportHeight / 2);
          final distance = (sectionMiddle - viewportMiddle).abs();

          if (distance < minDistance) {
            minDistance = distance;
            currentSection = sectionName;
          }
        }
      }
    });

    if (currentSection != null &&
        currentSection != ref.read(currentSectionProvider)) {
      ref.read(currentSectionProvider.notifier).updateSection(currentSection!);
    }
  }

  void scrollToSection(String section) {
    if (section == 'hero') {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      return;
    }
    final keyMap = {
      'about': _aboutKey,
      'experience': _experienceKey,
      'projects': _projectsKey,
      'courses': _coursesKey,
      'skills': _skillsKey,
      'contact': _contactKey,
    };

    final key = keyMap[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        onDrawerChanged: (isOpen) {
          ref.read(drawerStateProvider.notifier).setOpen(isOpen);
        },
        drawer: AppDrawer(onMenuItemTap: scrollToSection),
        appBar: MyAppBar(onMenuItemTap: scrollToSection),
        body: AnimatedGradientOrbs(
          orbCount: 6,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(key: _heroKey),
                AboutSection(key: _aboutKey),
                ExperienceSection(key: _experienceKey),
                ProjectsSection(key: _projectsKey),
                CoursesSection(key: _coursesKey),
                SkillsSection(key: _skillsKey),
                ContactSection(key: _contactKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
