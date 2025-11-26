import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
            'THE BEAT BEHIND THE CODE',
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Spotify-like Card (Placeholder)
        _MusicCard(),
        const SizedBox(height: 60),
        // Keep in Touch Section
        _KeepInTouchSection(),
        const SizedBox(height: 60),
      ],
    );
  }
}

class _MusicCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
            Theme.of(context).colorScheme.secondary.withValues(alpha: 0.3),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          // Album Art Placeholder
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.music_note,
              size: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The beat behind the code',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'My coding playlist',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.play_circle_filled,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

class _KeepInTouchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Let\'s Keep in Touch',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Stay updated on my latest projects, insights, and offerings. Whether you have questions, need advice, or just want to chat, don\'t hesitate to reach out!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 40),
        // Social Links
        Wrap(
          spacing: 40,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            _SocialLink(label: 'linkedin', url: 'https://linkedin.com'),
            _SocialLink(label: 'email', url: 'mailto:contact@example.com'),
            _SocialLink(
              label: 'github',
              url: 'https://github.com/mubashirspam',
            ),
            _SocialLink(label: 'twitter', url: 'https://twitter.com'),
            _SocialLink(label: 'dribbble', url: 'https://dribbble.com'),
          ],
        ),
        const SizedBox(height: 60),
        // Signature
        SvgPicture.asset(
          'assets/text.svg',
          width: 200,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onSurface,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Copyright © ${DateTime.now().year} — Made by Mubashir',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'mubashirahmad.dev',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}

class _SocialLink extends StatelessWidget {
  final String label;
  final String url;

  const _SocialLink({required this.label, required this.url});

  Future<void> _launchUrl() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchUrl,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.onSurface,
          decoration: TextDecoration.underline,
          decorationColor: Theme.of(
            context,
          ).colorScheme.onSurface.withValues(alpha: 0.3),
        ),
      ),
    );
  }
}
