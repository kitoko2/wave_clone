import 'dart:developer';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class TransfertController extends GetxController {
  var allContacts = [].obs;
  var favorisContact = [].obs;
  TextEditingController nomController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();

  var load = true.obs;
  final count = 0.obs;
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getContact();
    });
    super.onInit();
  }

  getContact() async {
    log("************************");
    log("${allContacts.value.isEmpty || favorisContact.value.isEmpty}");
    if (allContacts.value.isEmpty || favorisContact.value.isEmpty) {
      if (await Permission.contacts.request().isGranted) {
        List<Contact> contacts = await ContactsService.getContacts();
        allContacts.value = contacts;
        if (contacts.length > 5) {
          favorisContact.value = [
            contacts[0],
            contacts[1],
            contacts[2],
            contacts[3],
            contacts[4],
          ];
        } else {
          favorisContact.value = contacts;
        }
        load.value = false;
        // log(allContacts.value.toString());
      } else {
        print("not permission");
        load.value = false;
      }
    } else {
      log('Not empty');
    }
  }

  void increment() => count.value++;
}
