import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';

/// Home Screen — the first screen the user sees.
/// Shows profile picture, name, title, a short intro, and quick-navigation
/// buttons to the other sections of the app.
///
/// [onNavigate] is supplied by the parent (MainNavigation) so this screen
/// can request a switch to another bottom-navigation tab.
class HomeScreen extends StatelessWidget {
  final void Function(int index) onNavigate;

  const HomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            CircleAvatar(
              radius: 64,
              backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
              // Replace with: backgroundImage: AssetImage(PortfolioData.profileImageAsset),
              child: Icon(Icons.person, size: 64, color: theme.colorScheme.primary),
            ),
            const SizedBox(height: 20),
            Text(
              PortfolioData.name,
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              PortfolioData.title,
              style: theme.textTheme.titleMedium
                  ?.copyWith(color: theme.colorScheme.primary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              PortfolioData.shortIntro,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _QuickNavGrid(onNavigate: onNavigate),
          ],
        ),
      ),
    );
  }
}

/// A small internal widget with quick-access buttons to jump to the
/// other sections of the portfolio (About, Skills, Projects, Contact).
class _QuickNavGrid extends StatelessWidget {
  final void Function(int index) onNavigate;

  const _QuickNavGrid({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final items = [
      (label: 'About Me', icon: Icons.person_outline, index: 1),
      (label: 'Skills', icon: Icons.bar_chart_outlined, index: 2),
      (label: 'Projects', icon: Icons.folder_open_outlined, index: 3),
      (label: 'Contact', icon: Icons.mail_outline, index: 4),
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 14,
      crossAxisSpacing: 14,
      childAspectRatio: 1.4,
      children: items
          .map(
            (item) => _NavCard(
              label: item.label,
              icon: item.icon,
              onTap: () => onNavigate(item.index),
            ),
          )
          .toList(),
    );
  }
}

class _NavCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _NavCard({required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.primary.withOpacity(0.06),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 28, color: theme.colorScheme.primary),
              const SizedBox(height: 8),
              Text(label, style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
