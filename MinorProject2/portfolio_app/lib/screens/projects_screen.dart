import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../widgets/project_card.dart';
import 'project_detail_screen.dart';

/// Projects Screen — lists every completed project as a tappable card.
/// Tapping a card pushes the ProjectDetailScreen (Navigation & Routing).
class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final projects = PortfolioData.projects;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Projects',
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            '${projects.length} projects completed',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
          ...projects.map(
            (project) => ProjectCard(
              project: project,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProjectDetailScreen(project: project),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
