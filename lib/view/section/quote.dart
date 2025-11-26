import 'package:flutter/material.dart';

class QuoteSection extends StatelessWidget {
  const QuoteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
        // Quote Icon
        Icon(
          Icons.format_quote,
          size: 48,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        const SizedBox(height: 24),
        // Quote Text
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
            children: [
              TextSpan(
                text:
                    'Greatness lies in the extra 10%. It\'s about pushing limits, embracing details, and never settling for "good enough". I believe the difference comes from grit, purpose, and the drive to go the extra mile. ',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              TextSpan(
                text:
                    'Whether in code or design, my goal is to deliver work that stands out — because true impact comes from striving for excellence.',
                style: TextStyle(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 60),
        // Expertises Section
        _ExpertisesSection(),
      ],
    );
  }
}

class _ExpertisesSection extends StatelessWidget {
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
            'EXPERTISES',
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Expertise Cards
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                children: [
                  Expanded(
                    child: _ExpertiseCard(
                      number: '001',
                      title: 'Mobile Development',
                      icon: Icons.phone_android,
                      isAvailable: true,
                      statusText: 'Open for Collaboration',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _ExpertiseCard(
                      number: '002',
                      title: 'UI/UX Design',
                      icon: Icons.palette_outlined,
                      isAvailable: false,
                      statusText: 'Currently Committed',
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  _ExpertiseCard(
                    number: '001',
                    title: 'Mobile Development',
                    icon: Icons.phone_android,
                    isAvailable: true,
                    statusText: 'Open for Collaboration',
                  ),
                  const SizedBox(height: 16),
                  _ExpertiseCard(
                    number: '002',
                    title: 'UI/UX Design',
                    icon: Icons.palette_outlined,
                    isAvailable: false,
                    statusText: 'Currently Committed',
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}

class _ExpertiseCard extends StatelessWidget {
  final String number;
  final String title;
  final IconData icon;
  final bool isAvailable;
  final String statusText;

  const _ExpertiseCard({
    required this.number,
    required this.title,
    required this.icon,
    required this.isAvailable,
    required this.statusText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '($number)',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
              const Spacer(),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          // Icon placeholder
          Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.surface.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                size: 64,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ),
          const SizedBox(height: 40),
          // Status
          Row(
            children: [
              Text(
                statusText,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isAvailable ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
