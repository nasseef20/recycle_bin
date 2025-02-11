# Recycle বিন (Recycle bin)

![Recycle bin app logo](https://raw.githubusercontent.com/nasseef20/recycle_bin/40e7c922b298a09d6ebbba9a81c67a3c72562e7b/assets/logo_horizontal.svg)

A prototype app designed to locate and scan recycling bins across Dhaka, allowing users to earn rewards for recycling. Inspired by Germany's Pfand system, this app is part of our project, **Polystyrene Recycling and Urban Sustainability,** for the **Youth for Earth: An Innovative Case Solution Championship**, organized by the **Department of Soil, Water, and Environment, University of Dhaka.**


## Principle
Recycle bins will be installed all around Dhaka, which can be located from the app.

The recycle bins will contain digital screens that will show a QR code corresponding to the weight of plastics recycled.

The app will scan this QR code and upon doing so, an appropriate amount of monetary reward will be added to the user's wallet.

The reward can then be cashed out via Bangladesh's popular mobile banking services such as bKash or Nagad.

## QR code
To check the "Rewards" page of this prototype app, a QR code reading "dummy" is used.

**Scan this QR code in the "Scan Recycle Bin" menu.**

<img src="https://raw.githubusercontent.com/nasseef20/recycle_bin/refs/heads/master/assets/dummy_qr_code.png" width="200">


## Getting Started

This font contains localization, so please generate the l10n files by running `flutter gen-l10n`.

# Dependencies
```
  cupertino_icons: ^1.0.8
  flutter_launcher_icons: ^0.14.3
  provider: ^6.1.2
  geolocator: ^13.0.2
  intl: 0.19.0
  url_launcher: ^6.3.1
  fluttertoast: ^8.2.11
  mobile_scanner: ^6.0.6
  permission_handler: ^11.3.1
  lottie: ^3.3.1
  shared_preferences: ^2.5.2
  flutter_svg: ^2.0.17
```
# Sidenote
This app seems to build properly under Android Studio v2023.3.1.18 (Jellyfish). Newer versions cause various conflicts related to gradle, jvm and kotlin versions. 
Details: https://www.victorcarreras.dev/2024/10/the-flutter-and-java-21-mystery-in.html?m=1
