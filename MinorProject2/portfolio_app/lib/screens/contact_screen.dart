import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../widgets/section_heading.dart';
import '../widgets/social_icon_button.dart';

/// Contact Screen — email, phone, and links to LinkedIn / GitHub / social
/// media profiles.
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Contact',
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SectionHeading(title: 'Get in Touch'),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.email_outlined),
                  title: const Text('Email'),
                  subtitle: Text(PortfolioData.email),
                  onTap: () => _launch('mailto:${PortfolioData.email}'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.phone_outlined),
                  title: const Text('Phone'),
                  subtitle: Text(PortfolioData.phone),
                  onTap: () => _launch('tel:${PortfolioData.phone}'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.link),
                  title: const Text('LinkedIn'),
                  subtitle: const Text('View my profile'),
                  onTap: () => _launch(PortfolioData.linkedInUrl),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.code),
                  title: const Text('GitHub'),
                  subtitle: const Text('View my repositories'),
                  onTap: () => _launch(PortfolioData.githubUrl),
                ),
              ],
            ),
          ),
          const SectionHeading(title: 'Follow Me'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialIconButton(
                icon: Icons.alternate_email,
                url: PortfolioData.twitterUrl,
                color: Colors.blue,
              ),
              SocialIconButton(
                icon: Icons.camera_alt_outlined,
                url: PortfolioData.instagramUrl,
                color: Colors.pink,
              ),
              SocialIconButton(
                icon: Icons.business_center_outlined,
                url: PortfolioData.linkedInUrl,
                color: Colors.indigo,
              ),
              SocialIconButton(
                icon: Icons.code,
                url: PortfolioData.githubUrl,
                color: Colors.black87,
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
