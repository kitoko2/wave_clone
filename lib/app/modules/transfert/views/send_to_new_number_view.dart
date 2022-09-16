import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wave_clone/app/constants/colors.dart';
import 'package:wave_clone/app/modules/transfert/controllers/transfert_controller.dart';
import 'package:wave_clone/app/modules/transfert/views/send_money_view.dart';

class SendToNewNumberView extends GetView<TransfertController> {
  const SendToNewNumberView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(TransfertController());
    return Scaffold(
      backgroundColor: ConstantValue.settingbg,
      appBar: AppBar(
        title: const Text(
          "Envoyer de l'Argent",
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
              Get.to(
                SendMoneyView(
                    nom: controller.nomController.text,
                    number: controller.telephoneController.text),
                transition: Transition.downToUp,
              );
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
                  Text(
                    "Suivant",
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
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              cursorHeight: 23,
              controller: controller.nomController,
              decoration: const InputDecoration(
                hintText: "Nom complet",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ConstantValue.primarycolor,
                    width: 2,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    cursorHeight: 23,
                    controller: controller.telephoneController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "0X XX XX XX XX",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ConstantValue.primarycolor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
