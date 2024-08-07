import 'package:flutter/material.dart';

class CelulleLettre extends StatelessWidget {
  final Color couleurCellule;
  final String lettre;
  final String textOccurence;

  const CelulleLettre(
      {Key? key,
      required this.couleurCellule,
      required this.lettre,
      required this.textOccurence})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: couleurCellule,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0))),
        child: Row(
          children: [
            Text(
              " $lettre                  :",
              style: const TextStyle(
                  fontFamily: "Pacifico", fontSize: 24.0, color: Colors.white),
            ),
            Text(textOccurence,
                style: TextStyle(
                    fontFamily: "Pacifico",
                    fontSize: 24.0,
                    color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
