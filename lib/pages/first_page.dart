import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:recycle_bin/language_provider.dart';
import 'package:provider/provider.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    bool isBangla = languageProvider.locale.languageCode == 'bn';
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/logo_horizontal.svg',
          height: 40,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                "assets/recycle_bg.png",
                width: 400,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(onPressed: () {Navigator.pushNamed(context, '/loading_page');}, icon: const Icon(Icons.search, color: Colors.white,), label: Text(AppLocalizations.of(context)!.map_button)),
                SizedBox(height: 16),
                ElevatedButton.icon(onPressed: () {Navigator.pushNamed(context, '/scan_page');}, icon: const Icon(Icons.qr_code_scanner, color: Colors.white,), label: Text(AppLocalizations.of(context)!.scan_button)),
                SizedBox(height: 16),
                ElevatedButton.icon(onPressed: () {Navigator.pushNamed(context, '/wallet_page');}, icon: const Icon(Icons.wallet, color: Colors.white,), label: Text(AppLocalizations.of(context)!.wallet_button)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("English"),
            Switch(
              value: isBangla,
              onChanged: (value) {
                if (value) {
                  languageProvider.setLocale('bn');
                } else {
                  languageProvider.setLocale('en');
                }
              },
            ),
            const Text("বাংলা"),
          ],
        ),
      ),
    );
  }
}