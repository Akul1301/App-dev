import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// A round icon button used for social/contact links.
/// Opens [url] in an external app/browser when tapped.
class SocialIconButton extends StatelessWidget {
  final IconData icon;
  final String url;
  final Color color;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.url,
    required this.color,
  });

  Future<void> _openLink() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openLink,
      borderRadius: BorderRadius.circular(30),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: color.withOpacity(0.1),
        child: Icon(icon, color: color),
      ),
    );
  }
}
