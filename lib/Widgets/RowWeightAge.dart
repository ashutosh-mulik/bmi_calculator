import 'package:bmi_calculator/Config.dart';
import 'package:bmi_calculator/Controllers/BmiController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class RowWeightAge extends StatefulWidget {

  BmiController controller;
  RowWeightAge(this.controller);

  @override
  _RowWeightAgeState createState() => _RowWeightAgeState();
}

class _RowWeightAgeState extends State<RowWeightAge> {
  var weight = 0.obs;
  var age = 0.obs;

  void incWeight() {
    weight++;
  }

  void decWeight() {
    if (weight > 0) weight--;
  }

  void incAge() {
    age++;
  }

  void decAge() {
    if (age > 0) age--;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 250,
            child: Container(
              decoration: BoxDecoration(
                color: Config.colorVar1,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              margin: EdgeInsets.fromLTRB(20, 15, 5, 20),
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        "WEIGHT",
                        style: GoogleFonts.oswald(
                          color: Colors.white30,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Obx(
                      () => Text(
                        widget.controller.weight.value.toString(),
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                          child: ElevatedButton(
                            onLongPress: () {
                              widget.controller.decWeight();
                            },
                            onPressed: () {
                              widget.controller.decWeight();
                            },
                            child: Icon(Icons.remove, color: Colors.white),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(20),
                              primary: Color.fromRGBO(34, 39, 62, 1.0), // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              widget.controller.incWeight();
                            },
                            child: Icon(Icons.add, color: Colors.white),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(20),
                              primary: Color.fromRGBO(34, 39, 62, 1.0), // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 250,
            child: Container(
              decoration: BoxDecoration(
                color: Config.colorVar1,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              margin: EdgeInsets.fromLTRB(5, 15, 20, 20),
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        "AGE",
                        style: GoogleFonts.oswald(
                          color: Colors.white30,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Obx(
                      () => Text(
                        "${widget.controller.age.value}",
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              widget.controller.decAge();
                            },
                            child: Icon(Icons.remove, color: Colors.white),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(20),
                              primary: Color.fromRGBO(34, 39, 62, 1.0), // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              widget.controller.incAge();
                            },
                            child: Icon(Icons.add, color: Colors.white),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(20),
                              primary: Color.fromRGBO(34, 39, 62, 1.0), // <-- Button color
                              onPrimary: Colors.white, // <-- Splash color
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
