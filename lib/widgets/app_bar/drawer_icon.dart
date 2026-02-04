import 'package:flutter/material.dart';

class DrawerIcon extends StatefulWidget {
  const DrawerIcon({super.key});

  @override
  State<DrawerIcon> createState() => _DrawerIconState();
}

class _DrawerIconState extends State<DrawerIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  bool isOpen = false;

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
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: animation),
      onPressed: () {
        Scaffold.of(context).openDrawer();
        setState(() {
          isOpen ? controller.reverse() : controller.forward();
          isOpen = !isOpen;
        });
      },
    );
  }
}
