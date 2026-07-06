import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../widgets/section_heading.dart';

/// About Me Screen — personal background, education, career objective
/// and hobbies/interests.
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'About Me',
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SectionHeading(title: 'Background', icon: Icons.info_outline),
          Text(PortfolioData.personalBackground, style: theme.textTheme.bodyMedium),

          const SectionHeading(title: 'Education', icon: Icons.school_outlined),
          Text(PortfolioData.education, style: theme.textTheme.bodyMedium),

          const SectionHeading(title: 'Career Objective', icon: Icons.flag_outlined),
          Text(PortfolioData.careerObjective, style: theme.textTheme.bodyMedium),

          const SectionHeading(title: 'Interests & Hobbies', icon: Icons.favorite_border),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: PortfolioData.hobbies
                .map((hobby) => Chip(
                      label: Text(hobby),
                      backgroundColor: theme.colorScheme.primary.withOpacity(0.08),
                    ))
                .toList(),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
