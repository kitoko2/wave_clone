import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wave_clone/app/modules/home/views/detail_transaction_view.dart';

import '../models/tranfert.dart';

class Composant {
  static Widget myListTile(IconData iconData, String titre,
      {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                iconData,
                size: 29,
              ),
            ),
            Expanded(
              child: Text(
                titre,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget findagentTile(
      String titre, String description, String distance) {
    return Container(
      padding: EdgeInsets.only(right: 11, left: 11, top: 10, bottom: 30),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titre.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  distance,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Image.asset(
            "assets/logos/ic.png",
            width: 30,
          )
        ],
      ),
    );
  }

  static Widget historiqueTile(Transfert transfert) {
    return Container(
      color: Colors.white,
      child: ListTile(
        onTap: () {
          HapticFeedback.mediumImpact();
          Get.to(
              DetailTransactionView(
                transfert: transfert,
              ),
              transition: Transition.downToUp);
        },
        title: Text(
          transfert.destinataire!,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Color(0xff2a149d),
          ),
        ),
        subtitle: Text(transfert.date!),
        trailing: Text(
          transfert.montant!,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Color(0xff2a149d),
          ),
        ),
      ),
    );
  }
}
