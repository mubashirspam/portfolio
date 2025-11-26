import 'package:flutter/material.dart';

class BioSection extends StatelessWidget {
  const BioSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontWeight: FontWeight.w500,
          height: 1.3,
          fontSize: 24,
        ),
        children: [
          TextSpan(
            text:
                'Ciao 👋 — I\'m a Mobile Developer and Flutter Enthusiast based in India, passionate about building beautiful cross-platform applications. ',
            style: TextStyle(color: colorScheme.onSurface),
          ),
          TextSpan(
            text:
                'My focus is on crafting performant, user-friendly mobile experiences that solve real-world problems.',
            style: TextStyle(
              color: colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
