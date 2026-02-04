import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/drawer_provider.dart';

class DrawerIcon extends ConsumerStatefulWidget {
  const DrawerIcon({super.key});

  @override
  ConsumerState<DrawerIcon> createState() => _DrawerIconState();
}

class _DrawerIconState extends ConsumerState<DrawerIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Listen to the drawer state from the provider
    ref.listen(drawerStateProvider, (previous, next) {
      if (next) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });

    return IconButton(
      icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: animation),
      onPressed: () {
        if (Scaffold.of(context).isDrawerOpen) {
          Navigator.pop(context);
        } else {
          Scaffold.of(context).openDrawer();
        }
      },
    );
  }
}
