import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wave_clone/app/constants/colors.dart';
import 'package:wave_clone/app/constants/composant.dart';
import 'package:wave_clone/app/modules/facture/views/facture_view.dart';
import 'package:wave_clone/app/modules/home/views/qrcode_view.dart';
import 'package:wave_clone/app/modules/home/views/settings_view.dart';
import 'package:wave_clone/app/modules/transfert/views/transfert_view.dart';

import '../../../models/tranfert.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Transfert> transferts = [
    Transfert(
        destinataire: "A jean 0011223344",
        date: "sept. 08, 16:40",
        montant: "-4000F",
        idTransfert: "DYAPSJSBCOE"),
    Transfert(
        destinataire: "A Paul 0011223344",
        date: "sept. 08, 11:20",
        montant: "-5000F",
        idTransfert: "DYAPSJSBCOE"),
    Transfert(
      destinataire: "Dépôt",
      date: "sept. 01, 05:41",
      montant: "9000F",
      idTransfert: "DYAPSJSBCOE",
    ),
    Transfert(
        destinataire: "A jean 0011223344",
        date: "sept. 01, 09:20",
        montant: "-9000F",
        idTransfert: "DYAPSJSBCOE"),
    Transfert(
        destinataire: "A jean 0011223344",
        date: "sept. 08, 07:30",
        montant: "-4000F",
        idTransfert: "DYAPSJSBCOE"),
    Transfert(
        destinataire: "A jean 0011223344",
        date: "sept. 08, 10:50",
        montant: "-4000F",
        idTransfert: "DYAPSJSBCOE"),
    Transfert(
        destinataire: "A jean 0011223344",
        date: "sept. 08, 16:55",
        montant: "-4000F",
        idTransfert: "DYAPSJSBCOE"),
    Transfert(
        destinataire: "Retrait",
        date: "sept. 08, 16:40",
        montant: "-1000F",
        idTransfert: "DYAPSJSBCOE"),
    Transfert(
        destinataire: "A jean 0011223344",
        date: "sept. 08, 16:42",
        montant: "-4000F",
        idTransfert: "DYAPSJSBCOE"),
    Transfert(
        destinataire: "Retrait",
        date: "sept. 09, 16:41",
        montant: "-4300F",
        idTransfert: "DYAPSJSBCOE"),
  ];
  Widget chooseOption(String titre, Color color, String asset,
      {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.18),
            ),
            child: Center(
              child: Image.asset(
                asset,
                color: color,
                width: 38,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            titre,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Widget sliverAppBarWidget() {
    return SliverAppBar(
      backgroundColor: ConstantValue.mainColor,
      centerTitle: true,
      toolbarHeight: 65,
      leading: GestureDetector(
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.settings),
        ),
        onTap: () {
          Get.to(
            const SettingsView(),
            transition: Transition.downToUp,
          );
        },
      ),
      expandedHeight: 90,
      flexibleSpace: FlexibleSpaceBar(
        title: Obx(() {
          return Get.find<HomeController>().montantShow.value
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "700.000",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text(
                        "F",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.vibrate();
                        Get.find<HomeController>().montantShow.value = false;
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Icon(
                          Icons.visibility_off,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(8, (index) {
                    return index == 7
                        ? GestureDetector(
                            onTap: () {
                              HapticFeedback.vibrate();
                              Get.find<HomeController>().montantShow.value =
                                  true;
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 2, left: 5),
                              child: Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          )
                        : Container(
                            width: 7,
                            height: 7,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                          );
                  }),
                );
        }),
        centerTitle: true,
      ),
      pinned: true,
    );
  }

  Widget topWidget(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 290,
        child: Stack(
          children: [
            SizedBox(
              height: 260,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 160,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          chooseOption("Transfert", ConstantValue.mainColor,
                              "assets/logos/user.png", onTap: () {
                            Get.to(() => const TransfertView(),
                                transition: Transition.downToUp);
                          }),
                          chooseOption("Factures", Colors.yellow,
                              "assets/logos/idea.png", onTap: () {
                            Get.to(FactureView(),
                                transition: Transition.downToUp);
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.9),
              child: GestureDetector(
                onTap: () {
                  Get.to(const QrcodeView(
                    isforcarte: true,
                  ));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(19),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: Colors.lightBlue,
                    ),
                    width: 300,
                    height: 170,
                    child: Image.asset(
                      "assets/logos/carte.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: ConstantValue.mainColor,
      body: RefreshIndicator(
        color: ConstantValue.primarycolor,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            sliverAppBarWidget(),
            topWidget(context),
            SliverToBoxAdapter(
              child: Container(
                height: 7,
                color: const Color(0xfff1f1f1),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  return Composant.historiqueTile(transferts[i]);
                },
                childCount: transferts.length,
              ),
            ),
          ],
        ),
        onRefresh: () async {},
      ),
    );
  }
}
