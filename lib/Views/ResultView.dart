import 'package:bmi_calculator/Config.dart';
import 'package:bmi_calculator/Controllers/BmiController.dart';
import 'package:bmi_calculator/Widgets/NavigationDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultView extends StatelessWidget {
  
  Text resultText(String msg, Color color){
    return Text(
      msg,
      style: GoogleFonts.oswald(
        color: color,
        fontSize: 20,
      ),
    );
  }

  Text suggestionText(String msg){
    return Text(
      msg,
      textAlign: TextAlign.center,
      style: GoogleFonts.nunito(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {

    var data = Get.arguments;
    var resultTxt;
    var suggestionTxt;
    var bmi = (data[0] / data[1] / data[1]) * 10000;

    if (bmi < 16){
      resultTxt = resultText("Severe Thinness", Colors.redAccent);
      suggestionTxt = suggestionText("Consult dietitian.");
    }

    if (bmi >= 16 && bmi < 17){
      resultTxt = resultText("Moderate Thinness", Colors.yellowAccent);
      suggestionTxt = suggestionText("Eat enough carbohydrate, protein, and photochemical");
    }

    if (bmi >= 17 && bmi < 18.5){
      resultTxt = resultText("Mild Thinness", Colors.yellowAccent);
      suggestionTxt = suggestionText("Eat a balanced diet and choose your food carefully.");
    }

    if (bmi >= 18.5 && bmi < 24.9){
      resultTxt = resultText("Normal", Colors.greenAccent);
      suggestionTxt = suggestionText("You have normal body weight. Good job!");
    }

    if (bmi >= 24.9 && bmi < 30){
      resultTxt = resultText("Overweight", Colors.orangeAccent);
      suggestionTxt = suggestionText("Limit unhealthy foods in the household.");
    }

    if (bmi >= 30 && bmi < 35){
      resultTxt = resultText("Obese Class I", Colors.yellowAccent);
      suggestionTxt = suggestionText("Eat carbs along with proteins, vegetables, or good fats.");
    }

    if (bmi >= 35 && bmi < 40){
      resultTxt = resultText("Obese Class II", Colors.yellowAccent);
      suggestionTxt = suggestionText("Do regular physical activities and exercise.");
    }

    if (bmi >= 40){
      resultTxt = resultText("Obese Class III", Colors.redAccent);
      suggestionTxt = suggestionText("Consult dietitian.");
    }

    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Config.colorMain,
        title: Text("BMI CALCULATOR", textAlign: TextAlign.center, style: GoogleFonts.oswald()),
      ),
      backgroundColor: Config.colorMain,
      drawer: NavigationDrawer().drawer(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
                        child: Text(
                          "YOUR RESULT",
                          style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    width: Get.width,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
                      decoration: BoxDecoration(
                        color: Config.colorVar1,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 5),
                            child: resultTxt,
                          ),
                          Text(
                            bmi.toStringAsFixed(2),
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontSize: 90,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                            child: Column(
                              children: [
                                Text(
                                  "Normal BMI Range:",
                                  style: GoogleFonts.oswald(
                                    color: Colors.white30,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "18.5 – 24.9 kg/m2",
                                  style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(30),
                            child: suggestionTxt
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: SizedBox(
              height: 70,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  color: Config.colorRedVar,
                  child: Center(
                    child: Text(
                      "RE-CALCULATE YOUR BMI",
                      style: GoogleFonts.oswald(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
