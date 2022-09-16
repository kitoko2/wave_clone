import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wave_clone/app/constants/colors.dart';

class QrcodeView extends StatefulWidget {
  final bool isforcarte;
  const QrcodeView({super.key, this.isforcarte = false});

  @override
  State<QrcodeView> createState() => _QrcodeViewState();
}

class _QrcodeViewState extends State<QrcodeView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String valueS = "one";
  Barcode? result;
  QRViewController? controller;
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    this.controller!.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      HapticFeedback.vibrate();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   toolbarHeight: 110,
      //   title: Image.asset("assets/icones/logo.png"),
      // ),
      body: Stack(
        children: [
          widget.isforcarte && valueS == "two"
              ? Container(
                  color: Colors.white,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 250,
                        height: 430,
                        decoration: const BoxDecoration(
                            // color: ConstantValue.primarycolor,
                            ),
                        child: Image.asset(
                          "assets/logos/carte1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              : QRView(
                  key: qrKey,
                  overlay: QrScannerOverlayShape(
                    borderColor: ConstantValue.primarycolor,
                    borderWidth: 9,
                    borderRadius: 20,
                  ),
                  onQRViewCreated: _onQRViewCreated,
                ),
          Positioned(
            top: 20,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.close,
                size: 30,
                color: widget.isforcarte && valueS == "two"
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!widget.isforcarte)
                    Text(
                      "Scanner votre pièce",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                    ),
                  if (valueS == "one")
                    Text(
                      widget.isforcarte
                          ? "Scanner le QR code pour payer"
                          : "Veuillez photographier votre pièce d'identité",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            height: 1,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                    ),
                ],
              ),
            ),
          ),
          if (widget.isforcarte)
            Align(
              alignment: const Alignment(0, 0.9),
              child: CupertinoSlidingSegmentedControl<String>(
                  backgroundColor: Colors.black45,
                  thumbColor: Colors.grey,
                  groupValue: valueS,
                  children: {
                    "one": Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: const Text(
                        "Scanner un code",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    "two": Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: const Text(
                        "Ma carte",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  },
                  onValueChanged: (value) {
                    setState(() {
                      valueS = value!;
                    });
                  }),
            )
        ],
      ),
    );
  }
}
