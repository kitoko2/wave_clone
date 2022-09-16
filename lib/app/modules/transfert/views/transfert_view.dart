// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wave_clone/app/constants/colors.dart';
import 'package:wave_clone/app/modules/transfert/views/send_money_view.dart';
import 'package:wave_clone/app/modules/transfert/views/send_to_new_number_view.dart';

import '../controllers/transfert_controller.dart';

class TransfertView extends GetView<TransfertController> {
  const TransfertView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(TransfertController(), permanent: true);
    return Scaffold(
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextFormField(
              cursorHeight: 23,
              decoration: const InputDecoration(
                hintText: "A",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ConstantValue.primarycolor,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Obx(() {
              return controller.load.value == false
                  ? Expanded(
                      child: ListView(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(const SendToNewNumberView(),
                                  transition: Transition.downToUp);
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 43,
                                  height: 43,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ConstantValue.primarycolor,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 37,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  "Envoyer à un nouveau numéro",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          const Text(
                            "Favoris",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          for (var element in controller.favorisContact.value)
                            contactWidget(element, onTap: () {
                              Get.to(
                                SendMoneyView(
                                  nom: element.givenName ??
                                      element.displayName ??
                                      "Jean",
                                  number: element.phones!.isNotEmpty
                                      ? element.phones![0].value!
                                      : "098345641",
                                ),
                                transition: Transition.downToUp,
                              );
                            }),
                          const SizedBox(height: 30),
                          const Text(
                            "Contacts",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          const SizedBox(height: 5),
                          for (var element in controller.allContacts.value)
                            contactWidget(element, onTap: () {
                              Get.to(
                                SendMoneyView(
                                  nom: element.givenName ??
                                      element.displayName ??
                                      "Jean",
                                  number: element.phones!.isNotEmpty
                                      ? element.phones![0].value!
                                      : "098345641",
                                ),
                                transition: Transition.downToUp,
                              );
                            }),
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            })
          ],
        ),
      ),
    );
  }

  Widget contactWidget(Contact contact, {Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 2),
      leading: Container(
        width: 40,
        height: 40,
        decoration:
            BoxDecoration(color: Colors.grey.shade300, shape: BoxShape.circle),
        child: const Center(
          child: Icon(
            Icons.person,
            color: Colors.grey,
            size: 35,
          ),
        ),
      ),
      title: Text(
        contact.givenName ?? contact.displayName ?? "Jean",
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
      subtitle: Text(
        contact.phones!.isNotEmpty ? contact.phones![0].value! : "098345641",
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
