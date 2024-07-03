import "package:flutter/material.dart";
import "package:mix_it/utils/constants/constants.dart";

class FullPageLoader extends StatelessWidget {
  const FullPageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CircularProgressIndicator(
            color: kScaffoldContainer,
            strokeAlign: 6,
            strokeWidth: 12,
            semanticsLabel: 'Circular page loader',
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        Text(
          style: Theme.of(context).textTheme.titleLarge,
          "Loading ingredients...",
        )
      ],
    );
  }
}
