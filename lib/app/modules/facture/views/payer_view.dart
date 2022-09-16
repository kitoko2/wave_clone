import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wave_clone/app/constants/colors.dart';

class PayerView extends GetView {
  final String? receveur;
  const PayerView({Key? key, this.receveur}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantValue.settingbg,
      appBar: AppBar(
        title: const Text(
          "Payer",
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
        height: 100,
        child: Column(
          children: [
            const Text(
              "Paiement de facture sans frais!",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: ConstantValue.primarycolor),
            ),
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {},
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
                        "Payer",
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
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Container(
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
                        receveur![0],
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
                    receveur!,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            TextFormField(
              cursorHeight: 23,
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: "Numero",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ConstantValue.primarycolor,
                    width: 2,
                  ),
                ),
              ),
            ),
            TextFormField(
              cursorHeight: 23,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Montant",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ConstantValue.primarycolor,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
