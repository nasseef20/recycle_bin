import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:recycle_bin/language_provider.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  double balance = 57; //This number will be stored securedly and will be added to after each new scan.
  String convertNum(double number, String locale) {
    return NumberFormat("0.##", locale).format(number);
  }
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    bool isBangla = languageProvider.locale.languageCode == 'bn';
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Text(AppLocalizations.of(context)!.your_balance),
            SizedBox(height: 10),
            Text("৳${convertNum(balance, isBangla ? 'bn' : 'en')}", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.green),),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {}, 
              child: Text(AppLocalizations.of(context)!.bkash),   
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD12053), 
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {}, 
              child: Text(AppLocalizations.of(context)!.nagad),   
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF6941C), 
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text(AppLocalizations.of(context)!.charity),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        )
      )
    );
  }
}