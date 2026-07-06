import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../models/skill_model.dart';
import '../widgets/section_heading.dart';
import '../widgets/skill_progress_tile.dart';

/// Skills Screen — technical skills, soft skills and tools, each with a
/// progress indicator representing proficiency level.
class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Skills',
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          _buildCategorySection(context, SkillCategory.technical),
          _buildCategorySection(context, SkillCategory.soft),
          _buildCategorySection(context, SkillCategory.tool),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context, SkillCategory category) {
    final skills = PortfolioData.skillsByCategory(category);
    if (skills.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(title: category.label, icon: _iconFor(category)),
        ...skills.map((skill) => SkillProgressTile(skill: skill)),
      ],
    );
  }

  IconData _iconFor(SkillCategory category) {
    switch (category) {
      case SkillCategory.technical:
        return Icons.memory_outlined;
      case SkillCategory.soft:
        return Icons.psychology_outlined;
      case SkillCategory.tool:
        return Icons.build_outlined;
    }
  }
}
