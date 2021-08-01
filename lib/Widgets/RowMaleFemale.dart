import 'package:bmi_calculator/Config.dart';
import 'package:bmi_calculator/Controllers/BmiController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowMaleFemale extends StatefulWidget {

  BmiController controller;
  RowMaleFemale(this.controller);

  @override
  _RowMaleFemaleState createState() => _RowMaleFemaleState();
}

class _RowMaleFemaleState extends State<RowMaleFemale> {

  var maleColor = Colors.white30;
  var femaleColor = Colors.white30;
  var isMaleSelected = false;
  var isFemaleSelected = false;

  void selectMale(){
    unselectFemale();
    if(isMaleSelected){
      maleColor = Colors.white30;
      isMaleSelected = false;
    }else{
      maleColor = Colors.white;
      isMaleSelected = true;
    }
  }

  void unselectMale(){
    maleColor = Colors.white30;
    isMaleSelected = false;
  }

  void unselectFemale(){
    femaleColor = Colors.white30;
    isFemaleSelected = false;
  }

  void selectFemale(){
    unselectMale();
    if(isFemaleSelected){
      femaleColor = Colors.white30;
      isFemaleSelected = false;
    }else{
      femaleColor = Colors.white;
      isFemaleSelected = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 200,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.controller.selectMale();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Config.colorVar1,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                margin: EdgeInsets.fromLTRB(20, 20, 5, 20),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: Icon(
                          Icons.male,
                          size: 80,
                          color: widget.controller.maleColor,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Text(
                          "MALE",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.oswald(
                            color: widget.controller.maleColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 200,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  widget.controller.selectFemale();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Config.colorVar1,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                margin: EdgeInsets.fromLTRB(5, 20, 20, 20),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: Icon(
                          Icons.female,
                          size: 80,
                          color: widget.controller.femaleColor,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Text(
                          "FEMALE",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.oswald(
                            color: widget.controller.femaleColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
