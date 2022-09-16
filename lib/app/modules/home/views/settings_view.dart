import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave_clone/app/constants/colors.dart';
import 'package:wave_clone/app/constants/composant.dart';
import 'package:wave_clone/app/modules/home/controllers/home_controller.dart';
import 'package:wave_clone/app/modules/home/views/findagent_view.dart';
import 'package:wave_clone/app/modules/home/views/plafond_view.dart';
import 'package:wave_clone/app/modules/home/views/updatepassword_view.dart';
import 'package:wave_clone/app/modules/onboarding/views/onboarding_view.dart';

class SettingsView extends GetView<HomeController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: ConstantValue.settingbg,
      appBar: AppBar(
        title: const Text(
          'Paramètres',
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const Text(
              "Partager",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2.5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Composant.myListTile(
                      Icons.share,
                      "Inviter un ami à rejoindre wave",
                      onTap: () async {
                        await Share.share(
                            "Je t'invite à découvrir l'application Wave! Inscris-toi et envoie de l'argent pour seulement 1% depuis ton smartphone! Disponible au lien suivant:\n https://ci.mmapp.wave.com/web/referrals/c/5NXIK");
                      },
                    ),
                    Composant.myListTile(
                      Icons.star_outlined,
                      "Utiliser le code promotionnel",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 22),
                                title: const Text(
                                  "Code promo",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text(
                                      "ANNULER",
                                      style: TextStyle(
                                        color: ConstantValue.primarycolor,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text(
                                      "UTILISER",
                                      style: TextStyle(
                                        color: ConstantValue.primarycolor,
                                      ),
                                    ),
                                  ),
                                ],
                                content: TextFormField(
                                  autofocus: true,
                                  cursorColor: ConstantValue.primarycolor,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ConstantValue.primarycolor,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ConstantValue.primarycolor,
                                        width: 2,
                                      ),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ConstantValue.primarycolor,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Support",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Composant.myListTile(
                      Icons.phone,
                      "Appelez le service client gratuitement",
                      onTap: () async {
                        final Uri emailLaunchUri = Uri(
                          scheme: 'tel',
                          path: '1315',
                        );

                        await launchUrl(emailLaunchUri);
                      },
                    ),
                    Composant.myListTile(
                        Icons.document_scanner_rounded, "Vérifier le plafond",
                        onTap: () {
                      Get.to(
                        const PlafondView(),
                        transition: Transition.downToUp,
                      );
                    }),
                    Composant.myListTile(
                        Icons.location_on, "Trouvez les agents à proximité",
                        onTap: () {
                      Get.to(
                        const FindagentView(),
                        transition: Transition.downToUp,
                      );
                    }),
                    Composant.myListTile(
                        Icons.security, "Modifier le code secret", onTap: () {
                      Get.to(
                        const UpdatepasswordView(),
                        transition: Transition.downToUp,
                      );
                    }),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2.5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Obx(() {
                      return Composant.myListTile(
                        Icons.logout_rounded,
                        "Se deconnecter (${controller.numberConnected})",
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    "Êtes-vous sûr de vouloir vous déconnecter?",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        "ANNULER",
                                        style: TextStyle(
                                          color: ConstantValue.primarycolor,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        final prefs = await SharedPreferences
                                            .getInstance();

                                        prefs.clear();

                                        Get.offAll(const OnboardingView());
                                      },
                                      child: const Text(
                                        "SE DECONNECTER",
                                        style: TextStyle(
                                          color: ConstantValue.primarycolor,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
            Image.asset(
              "assets/logos/uba.jpg",
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
