// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'CelluleLettre.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, int> voyelleDeco = {
    "a": 0,
    "e": 0,
    "i": 0,
    "o": 0,
    "u": 0,
    "y": 0
  };
  int nbConsonnes = 0;

  void _incrementeA() {
    setState(() {
      int? value = voyelleDeco['a'];
      value = value! + 1;
      voyelleDeco['a'] = value;
    });
  }

  void _incrementeE() {
    setState(() {
      int? value = voyelleDeco['e'];
      value = value! + 1;
      voyelleDeco['e'] = value;
    });
  }

  void _incrementeI() {
    setState(() {
      int? value = voyelleDeco['i'];
      value = value! + 1;
      voyelleDeco['i'] = value;
    });
  }

  void _incrementeO() {
    setState(() {
      int? value = voyelleDeco['o'];
      value = value! + 1;
      voyelleDeco['o'] = value;
    });
  }

  void _incrementeU() {
    setState(() {
      int? value = voyelleDeco['u'];
      value = value! + 1;
      voyelleDeco['u'] = value;
    });
  }

  void _incrementeY() {
    setState(() {
      int? value = voyelleDeco['y'];
      value = value! + 1;
      voyelleDeco['y'] = value;
    });
  }

  void _incrementeConsonnes() {
    setState(() {
      nbConsonnes = nbConsonnes + 1;
    });
  }

  void _resetDeco() {
    setState(() {
      nbConsonnes = 0;
      voyelleDeco.forEach(
        (key, value) {
          voyelleDeco[key] = 0;
        },
      );
    });
  }

  void _analyse() {
    _resetDeco();
    for (var i = 0; i < monMot.length; i++) {
      switch (monMot[i]) {
        case 'a':
          _incrementeA();
          break;
        case 'e':
          _incrementeE();
          break;
        case 'i':
          _incrementeI();
          break;
        case 'o':
          _incrementeO();
          break;
        case 'u':
          _incrementeU();
          break;
        case 'y':
          _incrementeY();
          break;
        default:
          {
            _incrementeConsonnes();
          }
          break;
      }
    }
  }

  String monMot = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Analyser mots",
            style: TextStyle(
              fontFamily: "PlayfairDisplay-VariableFont_wght",
              fontSize: 20,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    hintText: "Entre votre mot",
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      monMot = newValue;
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _analyse,
                child: Text(
                  "Analyser",
                  style: TextStyle(
                    fontFamily: "PlayfairDisplay-VariableFont_wght",
                    fontSize: 40,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                    padding:
                        WidgetStateProperty.all(const EdgeInsets.all(10.0)),
                    textStyle: WidgetStateProperty.all(
                        const TextStyle(fontSize: 30.0))),
              ),
              CelulleLettre(
                  couleurCellule: Colors.red,
                  lettre: "A",
                  textOccurence: voyelleDeco["a"]! > 1
                      ? " ${voyelleDeco["a"]} occurences"
                      : "${voyelleDeco["a"]} occurence"),
              CelulleLettre(
                  couleurCellule: Colors.purple,
                  lettre: "E",
                  textOccurence: voyelleDeco["e"]! > 1
                      ? " ${voyelleDeco["e"]} occurences"
                      : "${voyelleDeco["e"]} occurence"),
              CelulleLettre(
                  couleurCellule: Colors.purple,
                  lettre: "I",
                  textOccurence: voyelleDeco["i"]! > 1
                      ? " ${voyelleDeco["i"]} occurences"
                      : "${voyelleDeco["i"]} occurence"),
              CelulleLettre(
                  couleurCellule: Colors.green,
                  lettre: "O",
                  textOccurence: voyelleDeco["o"]! > 1
                      ? " ${voyelleDeco["o"]} occurences"
                      : "${voyelleDeco["o"]} occurence"),
              CelulleLettre(
                  couleurCellule: Colors.indigo,
                  lettre: "U",
                  textOccurence: voyelleDeco["u"]! > 1
                      ? " ${voyelleDeco["u"]} occurences"
                      : "${voyelleDeco["u"]} occurence"),
              CelulleLettre(
                  couleurCellule: Colors.teal,
                  lettre: "Y",
                  textOccurence: voyelleDeco["y"]! > 1
                      ? " ${voyelleDeco["y"]} occurences"
                      : "${voyelleDeco["y"]} occurence"),
              CelulleLettre(
                  couleurCellule: Colors.black,
                  lettre: "Consonnes",
                  textOccurence: nbConsonnes > 1
                      ? " $nbConsonnes occurences"
                      : "$nbConsonnes occurence"),
            ],
          ),
        ));
  }
}
