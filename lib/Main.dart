import 'dart:ui';

import 'package:bmi_calculator/Config.dart';
import 'package:bmi_calculator/Controllers/BmiController.dart';
import 'package:bmi_calculator/Views/ResultView.dart';
import 'package:bmi_calculator/Widgets/NavigationDrawer.dart';
import 'package:bmi_calculator/Widgets/RowHeight.dart';
import 'package:bmi_calculator/Widgets/RowMaleFemale.dart';
import 'package:bmi_calculator/Widgets/RowWeightAge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  BmiController controller = BmiController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Config.colorMain, // navigation bar color
      statusBarColor: Config.colorMain, // status bar color
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Config.colorMain,
        primaryColor: Config.colorMain,
        backgroundColor: Config.colorMain,
        primaryColorDark: Config.colorMain,
        accentColor: Config.colorMain,
      ),
      home: Scaffold(
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
                child: Stack(
                  children: [
                    Column(
                      children: [
                        RowMaleFemale(controller),
                        RowHeight(controller),
                        RowWeightAge(controller),
                      ],
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
                    if (controller.isMaleSelected.isFalse && controller.isFemaleSelected.isFalse) {
                      Fluttertoast.showToast(msg: "Please select gender.", backgroundColor: Colors.red, gravity: ToastGravity.TOP);
                      return;
                    }

                    if (controller.height.value <= 0) {
                      Fluttertoast.showToast(msg: "Invalid height.", backgroundColor: Colors.red, gravity: ToastGravity.TOP);
                      return;
                    }

                    if (controller.weight.value <= 0) {
                      Fluttertoast.showToast(msg: "Invalid weight.", backgroundColor: Colors.red, gravity: ToastGravity.TOP);
                      return;
                    }

                    if (controller.age.value <= 0) {
                      Fluttertoast.showToast(msg: "Invalid age.", backgroundColor: Colors.red, gravity: ToastGravity.TOP);
                      return;
                    }

                    Get.to(ResultView(), arguments: [controller.weight.value, controller.height.value, controller.age.value]);
                  },
                  child: Container(
                    color: Config.colorRedVar,
                    child: Center(
                      child: Text(
                        "CALCULATE YOUR BMI",
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
      ),
    );
  }
}
