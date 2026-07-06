import 'package:flutter/material.dart';
import '../models/project_model.dart';

/// Project Detail Screen — a bonus screen showing full information about
/// a single project. Reached via Navigator.push from the Projects screen.
class ProjectDetailScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              // Replace this placeholder with:
              // Image.asset(project.imageAsset!, fit: BoxFit.cover)
              child: Icon(Icons.image_outlined,
                  size: 48, color: theme.colorScheme.primary),
            ),
            const SizedBox(height: 20),
            Text(
              project.title,
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(project.description, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 20),
            Text(
              'Technologies Used',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: project.technologies
                  .map((tech) => Chip(
                        label: Text(tech),
                        backgroundColor: theme.colorScheme.primary.withOpacity(0.08),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
