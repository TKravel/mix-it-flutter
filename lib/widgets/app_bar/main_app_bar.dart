import 'package:flutter/material.dart';

import 'package:mix_it/utils/colors/custom_colors.dart';
import 'package:mix_it/screens/home_page/home_page.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, required this.height});

  final double height;

  @override
  Size get preferredSize {
    return Size.fromHeight(height);
  }

  @override
  State<StatefulWidget> createState() {
    return _MainAppBar();
  }
}

class _MainAppBar extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextButton(
        style: ButtonStyle(
          foregroundColor:
              WidgetStateColor.resolveWith((Set<WidgetState> states) {
            return CustomColors.kAccent.shade100;
          }),
        ),
        onPressed: () => {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (_) => false)
        },
        child: const Text(
          "Mix-It!",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
