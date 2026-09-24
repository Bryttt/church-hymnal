import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackScreen extends StatefulWidget {
  final String recipientEmail;
  final String appName;

  const FeedbackScreen({
    super.key,
    this.recipientEmail = 'etornambright20@gmail.com',
    this.appName = 'ARS Hymnal',
  });

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  Future<void> _openEmail() async {
    final subject = Uri.encodeComponent('Feedback: ${widget.appName}');
    final body = Uri.encodeComponent(
      'Hi,\n\nI have feedback about the ${widget.appName} app:\n\n[Your message here]\n\nThank you!',
    );
    final mailtoLink = Uri(
      scheme: 'mailto',
      path: widget.recipientEmail,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    try {
      if (await canLaunchUrl(mailtoLink)) {
        await launchUrl(mailtoLink);
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open email app')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Send Feedback')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.mark_email_read,
                size: 59,
                color: Colors.white,
              ),
              const SizedBox(height: 24),
              Text(
                'We\'d love to hear from you!',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              const Text(
                'Tap the button below to send us feedback about the app.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: _openEmail,
                icon: const Icon(Icons.mail),
                label: const Text('Open Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}