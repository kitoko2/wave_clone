import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:wave_clone/app/constants/colors.dart';

class UpdatepasswordView extends StatefulWidget {
  const UpdatepasswordView({Key? key}) : super(key: key);

  @override
  State<UpdatepasswordView> createState() => _UpdatepasswordViewState();
}

class _UpdatepasswordViewState extends State<UpdatepasswordView> {
  var text = "";
  _onKeyboardTap(String value) {
    if (text.length <= 3) {
      setState(() {
        text = text + value;
      });
    }
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Center(
              child: Text(
                "Entrez votre code secret",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: text.length > index
                        ? ConstantValue.primarycolor
                        : ConstantValue.primarycolor.withOpacity(0.5),
                  ),
                );
              }),
            ),
            NumericKeyboard(
              onKeyboardTap: _onKeyboardTap,
              textColor: Colors.black,
              rightButtonFn: () {
                setState(() {
                  if (text.isNotEmpty) {
                    text = text.substring(0, text.length - 1);
                  }
                });
              },
              rightIcon: const Icon(
                Icons.backspace,
                color: Colors.black,
              ),
              leftButtonFn: () {},
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ],
        ),
      ),
    );
  }
}
