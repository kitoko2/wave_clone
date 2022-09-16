import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wave_clone/app/constants/colors.dart';
import 'package:wave_clone/app/constants/composant.dart';
import 'package:wave_clone/app/modules/home/views/qrcode_view.dart';

class PlafondView extends GetView {
  const PlafondView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantValue.settingbg,
      appBar: AppBar(
        title: const Text(
          'Plafonds du compte',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          onTap: () {
            Get.back();
          },
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: ConstantValue.settingbg,
        height: 80,
        child: Center(
          child: GestureDetector(
            onTap: () {
              Get.to(const QrcodeView());
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                color: ConstantValue.primarycolor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Augmenter mes limites",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Plafonds actuels",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          child: Text(
                            "Solde maximum de votre compte",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Text(
                          "200.000F",
                          style:
                              const TextStyle(fontSize: 17, color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          child: Text(
                            "Cumul mensuel total sur 30 jours",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Text(
                          "200.000F",
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Rendez-vous chez un agent Wave muni de votre pièce d'identité ou soumettez une photo de votre pièce pour déplafonner votre compte",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
