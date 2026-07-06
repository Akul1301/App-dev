// Represents a single skill entry used across the Skills screen.
//
// Demonstrates: class & object modeling, typed fields, and a named
// constructor with default values (Dart concepts required by the brief).
class Skill {
  final String name;
  final double proficiency; // Value between 0.0 and 1.0 for progress bars
  final SkillCategory category;

  const Skill({
    required this.name,
    required this.proficiency,
    this.category = SkillCategory.technical,
  });

  // A small helper function (Dart concept: functions) that converts the
  // raw proficiency value into a human readable label.
  String get proficiencyLabel {
    if (proficiency >= 0.85) return 'Expert';
    if (proficiency >= 0.6) return 'Proficient';
    if (proficiency >= 0.35) return 'Intermediate';
    return 'Beginner';
  }
}

enum SkillCategory { technical, soft, tool }

extension SkillCategoryLabel on SkillCategory {
  String get label {
    switch (this) {
      case SkillCategory.technical:
        return 'Technical Skills';
      case SkillCategory.soft:
        return 'Soft Skills';
      case SkillCategory.tool:
        return 'Tools & Technologies';
    }
  }
}
