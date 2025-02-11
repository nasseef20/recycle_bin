import 'package:flutter/material.dart';
import 'package:recycle_bin/pages/first_page.dart';
import 'package:recycle_bin/pages/map_page.dart';
import 'package:recycle_bin/pages/scan_page.dart';
import 'package:recycle_bin/pages/loading_page.dart';
import 'package:recycle_bin/pages/reward_page.dart';
import 'package:recycle_bin/pages/wallet_page.dart';
import 'package:recycle_bin/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:recycle_bin/language_provider.dart';
import 'package:provider/provider.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final languageProvider = LanguageProvider();
  await languageProvider.loadSavedLanguage();
  runApp(
    ChangeNotifierProvider(
      create: (context) => languageProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      title: 'Recycle বিন',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
      routes: {
        '/map_page' :(context) => MapPage(),
        '/scan_page' :(context) => ScanPage(),
        '/loading_page' :(context) => LoadingPage(),
        '/reward_page' :(context) => RewardPage(),
        '/wallet_page' :(context) => WalletPage()
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: languageProvider.locale,
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('bn', ''), // Bangla
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        // If the system's language is supported, use it; otherwise, fallback to English
        return supportedLocales.contains(locale) ? locale : const Locale('en', '');
      },
    );
  }
}

