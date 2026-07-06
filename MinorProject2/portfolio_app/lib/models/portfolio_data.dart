import 'project_model.dart';
import 'skill_model.dart';

// ---------------------------------------------------------------------
// PORTFOLIO_DATA
// ---------------------------------------------------------------------
// This file centralizes every piece of "content" the app displays.
// Everything in this file is DEMO / PLACEHOLDER TEXT.
// Replace the values below with your own information.
// ---------------------------------------------------------------------
class PortfolioData {
  // ---------------- Profile (Home / About) ----------------
  static const String name = 'Akul Malik';
  static const String title = 'Flutter & Mobile App Developer';
  static const String shortIntro =
      'I build clean, fast, and user-friendly mobile applications using '
      'Flutter and Dart. Welcome to my personal portfolio!';

  static const String profileImageAsset = 'assets/images/profile.png';

  static const String personalBackground =
      'I am a passionate software developer who enjoys turning ideas into '
      'real, working products. I love solving problems through code and '
      'constantly experimenting with new technologies.';

  static const String education =
      'B.Tech in Computer Science AIML,From GGSIPU'
      '(2024 - 2028)';

  static const String careerObjective =
      'To work as a professional mobile application developer, building '
      'impactful, scalable, and user-centric products while continuously '
      'growing my technical expertise.';

  static const List<String> hobbies = [
    'Reading tech blogs',
    'Open-source contribution',
    'Playing Guitar',
    'Playing chess',
  ];

  // ---------------- Skills ----------------
  static const List<Skill> skills = [
    Skill(name: 'Flutter', proficiency: 0.9, category: SkillCategory.technical),
    Skill(name: 'Dart', proficiency: 0.88, category: SkillCategory.technical),
    Skill(name: 'Firebase', proficiency: 0.7, category: SkillCategory.technical),
    Skill(name: 'REST APIs', proficiency: 0.75, category: SkillCategory.technical),
    Skill(name: 'Communication', proficiency: 0.85, category: SkillCategory.soft),
    Skill(name: 'Teamwork', proficiency: 0.8, category: SkillCategory.soft),
    Skill(name: 'Problem Solving', proficiency: 0.9, category: SkillCategory.soft),
    Skill(name: 'Git & GitHub', proficiency: 0.82, category: SkillCategory.tool),
    Skill(name: 'VS Code', proficiency: 0.9, category: SkillCategory.tool),
    Skill(name: 'Figma', proficiency: 0.6, category: SkillCategory.tool),
  ];

  // Function (Dart concept: functions) that filters skills by category.
  static List<Skill> skillsByCategory(SkillCategory category) {
    return skills.where((skill) => skill.category == category).toList();
  }

  // ---------------- Projects ----------------
  static const List<Project> projects = [
    Project(
      title: 'Personal Portfolio App',
      description:
          'A cross-platform mobile portfolio application built with '
          'Flutter, showcasing profile, skills, and projects with smooth '
          'navigation between screens.',
      technologies: ['Flutter', 'Dart'],
    ),
    Project(
      title: 'Expense Tracker',
      description:
          'A simple app to track daily expenses with category-wise '
          'breakdown and monthly summaries.',
      technologies: ['Flutter', 'Dart', 'SQLite'],
    ),
    Project(
      title: 'Weather Forecast App',
      description:
          'Displays real-time weather updates and a 5-day forecast using '
          'a public weather API.',
      technologies: ['Flutter', 'Dart', 'REST API'],
    ),
    Project(
      title: 'To-Do List Manager',
      description:
          'A task management app with add, edit, delete and mark-as-done '
          'functionality, backed by local storage.',
      technologies: ['Flutter', 'Dart', 'Shared Preferences'],
    ),
  ];

  // ---------------- Contact ----------------
  static const String email = 'aarav.sharma@example.com';
  static const String phone = '+91 98765 43210';
  static const String linkedInUrl = 'https://www.linkedin.com/in/your-profile';
  static const String githubUrl = 'https://github.com/your-username';
  static const String twitterUrl = 'https://twitter.com/your-handle';
  static const String instagramUrl = 'https://instagram.com/your-handle';
}
