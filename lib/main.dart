import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:tflite/tflite.dart';
import 'package:untitled1/AboutUs.dart';
import 'package:untitled1/ScanningScreen.dart';
import 'package:untitled1/HowToScan.dart';
import 'package:untitled1/HomeScreen.dart';
import 'Treatments.dart';
void main(){
runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
title: 'Arthritis Detector',
initialRoute:log_in.routeName ,
routes: {
  log_in.routeName:(context)=>log_in(),
  HowToScan.routeName:(context)=>HowToScan(),
  //AboutUs.routeName:(context)=>AboutUs(),
  //TfliteModel.routeName:(context)=>TfliteModel(),
  ImageClassificationDesign.routeName:(context)=>ImageClassificationDesign(),
  AboutUsScreen.routeName:(context)=>AboutUsScreen(),
  TreatmentScreen.routeName:(context)=>TreatmentScreen(),
  





},



));
}
