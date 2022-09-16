import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wave_clone/app/constants/composant.dart';

class FindagentView extends GetView {
  const FindagentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trouver un agent',
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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 5),
        children: [
          Composant.findagentTile(
            "SHILO BANK'S",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
            "116 m",
          ),
          Composant.findagentTile(
            "PEROU SERVICE",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
            "126 m",
          ),
          Composant.findagentTile(
            "BANK'S SENDER",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
            "216 m",
          ),
          Composant.findagentTile(
            "WAVE SENDER",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
            "316 m",
          ),
        ],
      ),
    );
  }
}
