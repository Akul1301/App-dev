// Represents a single project shown on the Projects screen and the
// Project Detail screen.
class Project {
  final String title;
  final String description;
  final List<String> technologies; // Dart concept: Lists
  final String? imageAsset; // Optional screenshot (asset path)
  final String? githubUrl;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    this.imageAsset,
    this.githubUrl,
  });

  // Simple derived getter (Dart concept: functions / data handling).
  String get technologiesSummary => technologies.join(' · ');
}
