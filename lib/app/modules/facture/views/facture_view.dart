import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:wave_clone/app/constants/colors.dart';
import 'package:wave_clone/app/modules/facture/views/payer_view.dart';

import '../controllers/facture_controller.dart';

class FactureView extends GetView<FactureController> {
  const FactureView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Paiements",
          style: TextStyle(color: Colors.black),
        ),
        toolbarHeight: 80,
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Factures",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            const SizedBox(height: 20),
            factureTileWidget("asset", "CNPS"),
            factureTileWidget("asset", "Canal+"),
            factureTileWidget("asset", "Pont HKB"),
            factureTileWidget("asset", "StarTimes"),
            const SizedBox(height: 20),
            const Text(
              "Autres",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            const SizedBox(height: 20),
            factureTileWidget("asset", "17EDUC"),
            factureTileWidget("asset", "Baloon Assurance"),
            factureTileWidget("asset", "CREDAFRICA"),
            factureTileWidget("asset", "DAM Africa"),
            factureTileWidget("asset", "ETA Nutrition"),
            factureTileWidget("asset", "Eva"),
            factureTileWidget("asset", "GS DJIGUIYA Espoir"),
            factureTileWidget("asset", "Leadway Vie"),
          ],
        ),
      ),
    );
  }

  Widget factureTileWidget(String asset, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: InkWell(
        onTap: () {
          HapticFeedback.mediumImpact();
          Get.to(
            PayerView(
              receveur: text,
            ),
            transition: Transition.downToUp,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ConstantValue.primarycolor,
                ),
                width: 38,
                height: 38,
                child: Center(
                  child: Text(
                    text[0],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
