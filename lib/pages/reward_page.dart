import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:recycle_bin/language_provider.dart';
import 'package:intl/intl.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({super.key});

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  double reward = 20; //These numbers will be obtained from the qr code in reality.
  double weight = 997;
  String convertNum(double number, String locale) {
    return NumberFormat("0.##", locale).format(number);
  }
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    bool isBangla = languageProvider.locale.languageCode == 'bn';
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Lottie.asset(
              "assets/reward_animation.json",
              repeat: false,
              fit: BoxFit.contain,
              width: 600
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                Text(AppLocalizations.of(context)!.you_have_earned),
                SizedBox(height: 10),
                Text("৳${convertNum(reward, isBangla ? 'bn' : 'en')}", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.green),),
                SizedBox(height: 20),
                Text(AppLocalizations.of(context)!.from_recycling),
                SizedBox(height: 10),
                Text("${convertNum(weight, isBangla ? 'bn' : 'en')} ${AppLocalizations.of(context)!.grams}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF4D4D4D)),),
                SizedBox(height: 30),
                ElevatedButton.icon(onPressed: () {Navigator.pushNamed(context, '/wallet_page');}, icon: const Icon(Icons.wallet, color: Colors.white,), label: Text(AppLocalizations.of(context)!.check_wallet)),
              ],
            )
        ),
        ],
      
      )
    );
  }
}