import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
    void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        '/map_page',
      );
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Keeps Column centered
          children: [
            CircularProgressIndicator(), // Loading animation
            SizedBox(height: 20), // Adds spacing
            Text(
              AppLocalizations.of(context)!.loading_text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4D4D4D)),
            ),
          ],
        ),
      ),
    );
  }
}