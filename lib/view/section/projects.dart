import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.outline.withValues(alpha: 0.5),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'PROJECTS',
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFB4E4B4),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: -20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _MockMobileScreen(label: 'Planet preserving'),
                    const SizedBox(width: 16),
                    Transform.translate(
                      offset: const Offset(0, -30),
                      child: _MockMobileScreen(label: 'Social awareness'),
                    ),
                    const SizedBox(width: 16),
                    _MockMobileScreen(label: 'Rewarding system'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MockMobileScreen extends StatelessWidget {
  final String label;

  const _MockMobileScreen({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 240,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const CircleAvatar(radius: 15, backgroundColor: Color(0xFFB4E4B4)),
          const SizedBox(height: 8),
          Container(height: 4, width: 40, color: Colors.grey[200]),
          const Spacer(),

          Icon(Icons.forest, size: 40, color: Colors.green[800]),
          const Spacer(),
          Text(
            label.split(' ').first,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
