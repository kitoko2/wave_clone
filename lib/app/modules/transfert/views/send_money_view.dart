import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wave_clone/app/constants/colors.dart';

class SendMoneyView extends GetView {
  final String? nom;
  final String? number;

  const SendMoneyView({Key? key, required this.nom, required this.number})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                      "Envoyer",
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
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "A",
                style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                nom!,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 22, 21, 43),
                    fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                number!,
                style: TextStyle(color: Colors.grey.shade500, fontSize: 17),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              TextFormField(
                cursorHeight: 23,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Montant Envoyé",
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
                  hintText: "Montant Recu",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ConstantValue.primarycolor,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Frais Wave = 1%",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: ConstantValue.primarycolor),
                ),
              ),
              const Center(
                child: Text(
                  "Frais maximum: 5.000F",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: ConstantValue.primarycolor),
                ),
              ),
            ],
          ),
        ));
  }
}
