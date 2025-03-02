import 'dart:async';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';

class CameraService extends GetxService {
  Widget openScanner() {
    final completer = Completer<String>();
    final controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.unrestricted,
      facing: CameraFacing.front,
      formats: [
        BarcodeFormat.ean8,
        BarcodeFormat.ean13,
        BarcodeFormat.upcA,
        BarcodeFormat.upcE,
        BarcodeFormat.code39,
        BarcodeFormat.code93,
        BarcodeFormat.code128,
        BarcodeFormat.dataMatrix,
        BarcodeFormat.qrCode,

        // BarcodeFormat.all,
      ],
    );
    Map<String, int> codes = {};
    return MobileScanner(
      controller: controller,
      onDetect: (capture) {
        final List<Barcode> barcodes = capture.barcodes;
        if (barcodes.isNotEmpty && !completer.isCompleted) {
          final String? code = barcodes.first.rawValue;
          if (code != null) {
            // controller.dispose();

            if (codes.containsKey(code)) {
              codes[code] = codes[code]! + 1;
            } else {
              codes[code] = 1;
            }
            print('micode ${codes.toString()}');
            // completer.complete(code);
          }
        }
      },
    );
  }

  Future<String> scan() async {
    final completer = Completer<String>();
    final controller = MobileScannerController();

    final scannerWidget = Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          DelayedDisplay(
            slidingBeginOffset: const Offset(0, 0.1),
            delay: const Duration(milliseconds: 500),
            child: MobileScanner(
              controller: controller,
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                if (barcodes.isNotEmpty && !completer.isCompleted) {
                  final String? code = barcodes.first.rawValue;
                  if (code != null) {
                    controller.dispose();
                    Get.back();
                    completer.complete(code);
                  }
                }
              },
            ),
          ),
          Center(
            child: Container(
              width: Get.width * 0.7,
              height: Get.width * 0.7,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Indicaciones para el usuario
          Positioned(
            bottom: Get.height * 0.1,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Coloca el código dentro del recuadro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Escanear código',
            style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              controller.dispose();
              Get.back();
              completer.complete('');
            },
          ),
          IconButton(
            icon: const Icon(Icons.flash_on),
            onPressed: () => controller.toggleTorch(),
          ),
        ],
      ),
    );

    Get.to(
      () => scannerWidget,
      transition: Transition.fadeIn,
      duration: const Duration(milliseconds: 500),
    );
    return completer.future;
  }
}
