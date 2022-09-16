import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wave_clone/app/constants/colors.dart';
import 'package:wave_clone/app/models/tranfert.dart';

class DetailTransactionView extends GetView {
  final Transfert? transfert;
  const DetailTransactionView({Key? key, this.transfert}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ConstantValue.mainColor.withOpacity(0.18),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/logos/user.png",
                      color: ConstantValue.mainColor,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              transfert!.montant!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              transfert!.destinataire!,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
            listDescription("Montant recu", transfert!.montant!),
            listDescription("Frais", "40F"),
            listDescription("Status", "Effectué"),
            listDescription("Date et heure", transfert!.date!),
            listDescription("Nouveau solde", "3000F"),
            listDescription("ID de Transaction", transfert!.idTransfert!),
            const SizedBox(height: 30),
            const Text(
              "En partenariat avec UBA.",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listDescription(String titre, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          titre,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
        Text(
          description,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ],
    );
  }
}
