import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wave_clone/app/constants/colors.dart';
import 'package:wave_clone/app/modules/home/views/home_view.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  TextEditingController numberController = TextEditingController();
  _onKeyboardTap(String value) {
    if (numberController.text.length <= 9) {
      setState(() {
        numberController.text = numberController.text + value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(),
      () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
    );

    return Scaffold(
      bottomSheet: Container(
        height: 80,
        child: Center(
          child: GestureDetector(
            onTap: () async {
              if (numberController.text.length == 10) {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('isConnected', true);
                prefs.setString("number", numberController.text);

                Get.offAll(const HomeView());
              } else {
                Fluttertoast.showToast(
                    msg: "numero incorect, entrer 10 chiffres");
              }
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                color: ConstantValue.primarycolor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Center(
                child: Text(
                  "Suivant",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Center(
                  child: Text(
                    "Bienvenue chez Wave! Pour commencer, entrez votre numéro de mobile",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                IgnorePointer(
                  child: TextFormField(
                    cursorHeight: 23,
                    showCursor: false,
                    controller: numberController,
                    style: TextStyle(fontSize: 18),
                    autofocus: true,
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
                ),
              ],
            ),
            const SizedBox(height: 20),
            NumericKeyboard(
              onKeyboardTap: _onKeyboardTap,
              textColor: Colors.black,
              rightButtonFn: () {
                setState(() {
                  if (numberController.text.isNotEmpty) {
                    numberController.text = numberController.text
                        .substring(0, numberController.text.length - 1);
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
