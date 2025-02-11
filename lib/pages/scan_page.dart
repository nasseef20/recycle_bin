//TODO: Fix the error where after granting permission on first run, the camera does not work. Going back and reclicking the scan button works.

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';



class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final MobileScannerController controller = MobileScannerController();
  bool isCameraStarted = false;
  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  @override
  void dispose() {
    controller.dispose(); 
    super.dispose();
  }

  Future<void> _requestCameraPermission() async {
    var status = await Permission.camera.status;

    if (!status.isGranted) {
      status = await Permission.camera.request();
    }

    if (status.isGranted) {
      setState(() {
        isCameraStarted = true;
        controller.start();
      });
    } else if (status.isDenied) {
      _showPermissionDialog();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.no_camera_permission),
        content: Text(AppLocalizations.of(context)!.request_camera_permission),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.ok),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isCameraStarted) {
      controller.start();
    }
    return Scaffold(
      appBar: AppBar(      
        title: Text(AppLocalizations.of(context)!.scan_qr_code),
        actions: [
          IconButton(
            icon: Icon(Icons.flash_on),
            onPressed: () => controller.toggleTorch(),
          ),
          IconButton(
            icon: Icon(Icons.switch_camera),
            onPressed: () => controller.switchCamera(),
          ),
        ],   
      ),
      body: MobileScanner(
        controller: controller,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            final scannedData = barcode.rawValue;
            debugPrint('QR Code found: ${barcode.rawValue}');
            if(scannedData == 'dummy'){ //in a real recycle bin this will point to some secured code with the amount embedded
              Navigator.pushReplacementNamed(context, '/reward_page').then((_){
                controller.stop();
              });
            }

          }
        },
      ),
    );
  }
}