
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiController extends GetxController{
  RxInt height = 0.obs;
  RxInt weight = 50.obs;
  RxInt age = 15.obs;
  RxBool isMaleSelected = false.obs;
  RxBool isFemaleSelected = false.obs;
  var maleColor = Colors.white30;
  var femaleColor = Colors.white30;

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

  void selectMale(){
    unselectFemale();
    if(isMaleSelected.value){
      maleColor = Colors.white30;
      isMaleSelected.value = false;
    }else{
      maleColor = Colors.white;
      isMaleSelected.value = true;
    }
  }

  void unselectMale(){
    maleColor = Colors.white30;
    isMaleSelected.value = false;
  }

  void unselectFemale(){
    femaleColor = Colors.white30;
    isFemaleSelected.value = false;
  }

  void selectFemale(){
    unselectMale();
    if(isFemaleSelected.value){
      femaleColor = Colors.white30;
      isFemaleSelected.value = false;
    }else{
      femaleColor = Colors.white;
      isFemaleSelected.value = true;
    }
  }

}