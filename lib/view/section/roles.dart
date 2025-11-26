import 'package:flutter/material.dart';

class RolesSection extends StatelessWidget {
  const RolesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
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
            'CURRENT ROLES',
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Independent Contractor Card
        _RoleCard(
          title: 'Independent Contractor',
          description:
              'I\'m available for a limited number of collaborative projects each year. If you\'re interested in exploring potential opportunities, feel free to reach out, and let\'s see how we can create something remarkable together.',
          badge: _AvailabilityBadge(isAvailable: true),
        ),
        const SizedBox(height: 16),
        // Company Role Card
        _RoleCard(
          title: 'Freelance Developer',
          description:
              'Specializing in the development of cross-platform mobile applications, I leverage Flutter to build beautiful and intuitive experiences. My focus lies in crafting seamless user experiences that enhance usability and fulfill client needs.',
          badge: null,
        ),
        const SizedBox(height: 60),
        // Client Feedback Section
        _ClientFeedbackSection(),
      ],
    );
  }
}

class _RoleCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget? badge;

  const _RoleCard({required this.title, required this.description, this.badge});

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
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              if (badge != null) badge!,
            ],
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class _AvailabilityBadge extends StatelessWidget {
  final bool isAvailable;

  const _AvailabilityBadge({required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isAvailable
            ? Colors.green.withValues(alpha: 0.2)
            : Colors.red.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isAvailable ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            isAvailable ? 'OPEN FOR COLLABORATION' : 'CURRENTLY COMMITTED',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: isAvailable ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class _ClientFeedbackSection extends StatelessWidget {
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
            'CLIENT FEEDBACK',
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 24),
        _TestimonialCard(
          author: 'Sarah Johnson',
          company: 'Tech Startup',
          feedback:
              'Mubashir did an exceptional job working with us. The communication was smooth, he delivered high-quality work ahead of time and changes/reviews were effortless for us. Highly recommend working with Mubashir. If we ever need support again, we would definitely work with Mubashir again.',
        ),
      ],
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final String author;
  final String company;
  final String feedback;

  const _TestimonialCard({
    required this.author,
    required this.company,
    required this.feedback,
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
          Text(
            '$author — $company',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '"$feedback"',
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              fontStyle: FontStyle.italic,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
