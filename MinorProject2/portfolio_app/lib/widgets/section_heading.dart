import 'package:flutter/material.dart';

/// A reusable heading used at the top of each content section
/// (e.g. "Education", "Skills", "Projects").
///
/// Demonstrates: a StatelessWidget built for reuse across multiple screens.
class SectionHeading extends StatelessWidget {
  final String title;
  final IconData? icon;

  const SectionHeading({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 20),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: theme.colorScheme.primary, size: 20),
            const SizedBox(width: 8),
          ],
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
