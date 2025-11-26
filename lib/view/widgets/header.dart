import 'package:flutter/material.dart';
import 'package:mubashir/provider/theme_provider.dart';
import 'dart:async';

class PortfolioHeader extends StatelessWidget {
  const PortfolioHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .all(16.0),
      child: Row(
        children: [
          ListenableBuilder(
            listenable: ThemeManager.instance,
            builder: (context, _) {
              final currentColor = ThemeManager.instance.seedColor;
              return _ColorPicker(currentColor: currentColor);
            },
          ),
          const SizedBox(width: 8),
          ListenableBuilder(
            listenable: ThemeManager.instance,
            builder: (context, _) {
              final currentMode = ThemeManager.instance.themeMode;
              IconData icon;
              switch (currentMode) {
                case ThemeMode.light:
                  icon = Icons.light_mode;
                  break;
                case ThemeMode.dark:
                  icon = Icons.dark_mode;
                  break;
                case ThemeMode.system:
                  icon = Icons.settings_suggest;
                  break;
              }

              return _PopupMenuButton(icon: icon, currentMode: currentMode);
            },
          ),

          const Spacer(),

          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _StatusChip(icon: Icons.location_on_outlined, label: 'INDIA'),
              _StatusChip(icon: Icons.language, label: 'UTC+5:30'),
              _TimeChip(),
            ],
          ),
        ],
      ),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  final Color currentColor;
  const _ColorPicker({required this.currentColor});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Color>(
      initialValue: currentColor,
      offset: const Offset(0, 50),
      shape: RoundedRectangleBorder(borderRadius: .circular(12)),
      icon: Icon(Icons.auto_awesome, size: 20),
      onSelected: (Color color) {
        ThemeManager.instance.changeColor(color);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Color>>[
        ...ThemeConstants.availableColors.map((color) {
          return PopupMenuItem<Color>(
            value: color,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            ),
          );
        }),
      ],
    );
  }
}

class _PopupMenuButton extends StatelessWidget {
  final IconData icon;
  final ThemeMode currentMode;
  const _PopupMenuButton({required this.icon, required this.currentMode});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ThemeMode>(
      initialValue: currentMode,
      offset: const Offset(0, 50),
      shape: RoundedRectangleBorder(borderRadius: .circular(12)),
      icon: Icon(icon, size: 20),
      onSelected: (ThemeMode mode) {
        ThemeManager.instance.changeThemeMode(mode);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ThemeMode>>[
        const PopupMenuItem<ThemeMode>(
          value: .light,
          child: Row(
            children: [
              Icon(Icons.light_mode, size: 20),
              SizedBox(width: 12),
              Text('Light'),
            ],
          ),
        ),
        const PopupMenuItem<ThemeMode>(
          value: .dark,
          child: Row(
            children: [
              Icon(Icons.dark_mode, size: 20),
              SizedBox(width: 12),
              Text('Dark'),
            ],
          ),
        ),
        const PopupMenuItem<ThemeMode>(
          value: .system,
          child: Row(
            children: [
              Icon(Icons.settings_suggest, size: 20),
              SizedBox(width: 12),
              Text('System'),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  final IconData? icon;
  final String label;

  const _StatusChip({this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const .symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: .circular(20),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: colorScheme.onSurfaceVariant),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: .w600,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeChip extends StatefulWidget {
  const _TimeChip();

  @override
  State<_TimeChip> createState() => _TimeChipState();
}

class _TimeChipState extends State<_TimeChip> {
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = .now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = .now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hour = _currentTime.hour.toString().padLeft(2, '0');
    final minute = _currentTime.minute.toString().padLeft(2, '0');
    return _StatusChip(icon: Icons.access_time, label: '$hour:$minute');
  }
}
