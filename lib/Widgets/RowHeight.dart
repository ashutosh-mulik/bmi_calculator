import 'package:bmi_calculator/Config.dart';
import 'package:bmi_calculator/Controllers/BmiController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class RowHeight extends StatefulWidget {

  BmiController controller;
  RowHeight(this.controller);

  @override
  _RowHeightState createState() => _RowHeightState();
}

class _RowHeightState extends State<RowHeight> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 200,
            child: Container(
              decoration: BoxDecoration(
                color: Config.colorVar1,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        "HEIGHT",
                        style: GoogleFonts.oswald(
                          color: Colors.white30,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            widget.controller.height.value.round().toString(),
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontSize: 50,
                            ),
                          ),
                          Text(
                            "cm",
                            style: GoogleFonts.oswald(
                              color: Colors.white30,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Slider(
                        value: widget.controller.height.value.toDouble(),
                        min: 0,
                        max: 220,
                        activeColor: Config.colorRedVar,
                        onChanged: (double value) {
                          setState(() {
                            widget.controller.height.value = value.toInt();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
