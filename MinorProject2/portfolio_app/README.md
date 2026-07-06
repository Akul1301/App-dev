# Personal Portfolio App

A cross-platform mobile portfolio application built with **Flutter** and **Dart**,
created as the Week 02 Minor Project for the App Development course.

> All names, bios, project details, and contact info in this app are **demo
> placeholder text** (see `lib/models/portfolio_data.dart`). Replace them with
> your own information before submitting/using the app.

## Project Overview

The app acts as a digital resume/portfolio that can be shared with potential
employers, clients, or collaborators. It presents a profile, personal
background, skills, completed projects, and contact details across five
screens connected by a bottom navigation bar.

## Features Implemented

- **Home Screen** — profile picture, name, professional title, short intro,
  and quick-navigation cards to every other section.
- **About Me Screen** — personal background, education, career objective,
  and interests/hobbies (as chips).
- **Skills Screen** — technical skills, soft skills, and tools, each grouped
  by category with animated progress-bar indicators.
- **Projects Screen** — list of completed projects as tappable cards; tapping
  a card opens a **Project Detail Screen** (bonus) with full description and
  tech stack.
- **Contact Screen** — email, phone, LinkedIn, GitHub, and social media
  links, each of which opens the relevant app/browser via `url_launcher`.
- **Navigation** — Material 3 `NavigationBar` (bottom nav) for switching
  between the five main sections, plus `Navigator.push` for the project
  detail flow.
- **Dark Mode support** (bonus) — the app follows the system theme
  automatically.

## Technologies Used

- **Flutter** (Material 3)
- **Dart**
- Package: `url_launcher` (for opening email/phone/social links)
- Package: `cupertino_icons`

## Project Structure

```
lib/
  main.dart                     # App entry point + bottom navigation
  models/
    project_model.dart          # Project data class
    skill_model.dart            # Skill data class + category enum
    portfolio_data.dart         # All placeholder/demo content in one place
  screens/
    home_screen.dart
    about_screen.dart
    skills_screen.dart
    projects_screen.dart
    project_detail_screen.dart  # Bonus: project detail screen
    contact_screen.dart
  widgets/
    section_heading.dart        # Reusable section title
    skill_progress_tile.dart    # Reusable skill row + progress bar
    project_card.dart           # Reusable project card
    social_icon_button.dart     # Reusable circular social icon button
assets/
  images/                       # Put profile.png and project screenshots here
```

## Installation Steps

1. **Install Flutter SDK** (if not already installed):
   https://docs.flutter.dev/get-started/install

2. **Clone this repository**
   ```bash
   git clone <your-repo-url>
   cd portfolio_app
   ```

3. **Get dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the app**
   ```bash
   flutter run
   ```
   Select a connected device/emulator when prompted.

5. **(Optional) Build a release APK**
   ```bash
   flutter build apk --release
   ```

## Customizing the Content

All editable text lives in **`lib/models/portfolio_data.dart`**. Update the
constants there (name, title, bio, education, skills, projects, contact
links) and the whole app updates automatically — no need to touch the screen
files.

To add real images:
1. Place image files inside `assets/images/`.
2. Reference them via `Image.asset('assets/images/your_file.png')` in place
   of the placeholder icons in `home_screen.dart` and `project_detail_screen.dart`.

## Screenshots of the Application

_Add screenshots here after running the app, e.g.:_

| Home | About | Skills | Projects | Contact |
|------|-------|--------|----------|---------|
| _screenshot_ | _screenshot_ | _screenshot_ | _screenshot_ | _screenshot_ |

## Author

Replace this section with your own name and links once you personalize the
project content.
