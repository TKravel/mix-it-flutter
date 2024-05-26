import 'package:flutter/material.dart';

class DrinkCardSm extends StatelessWidget {
  const DrinkCardSm({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("test"),
        Column(
          children: [
            Text("tes1"),
            Text("test2"),
          ],
        )
      ],
    );
  }
}
