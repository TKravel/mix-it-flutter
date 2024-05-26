import 'package:flutter/material.dart';

class SelectionGrid extends StatefulWidget {
  const SelectionGrid({super.key});

  @override
  State<SelectionGrid> createState() {
    return _SelectionGrid();
  }
}

class _SelectionGrid extends State<SelectionGrid> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("test"),
        Text("test"),
      ],
    );
  }
}
