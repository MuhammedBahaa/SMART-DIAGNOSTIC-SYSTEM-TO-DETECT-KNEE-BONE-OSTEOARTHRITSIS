import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled1/AboutUs.dart';
import 'package:untitled1/ScanningScreen.dart';
import 'package:untitled1/HowToScan.dart';



class log_in  extends StatelessWidget {
  static const String routeName='log_in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      extendBodyBehindAppBar:true,

      appBar:AppBar(
        backgroundColor:Colors.teal,
        elevation:0,


      ),
      body:Stack(

        children: [
         Image.asset('assets/images/bg.jpeg',width:double.infinity,fit:BoxFit.cover),
          Column(crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Container(child: Image.asset('assets/images/knee-logo.jpg',height: 250,width: 300,),margin: EdgeInsets.only(top: 100)),
              Container(
                child: Row(
                  children: [
                    Text('ARTHRITIS-',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    Text('DETECTOR ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromRGBO(25, 154, 142, 1))),
                  ],
                ),margin: EdgeInsets.only(left: 45,top: 20,bottom: 25),),
              Container(child: Text('Let’s get started! ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,)),),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              Expanded(
            child: Column(crossAxisAlignment:CrossAxisAlignment.stretch,
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin:EdgeInsets.symmetric(vertical: 15),
                      child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Color.fromRGBO(25, 154, 142, 1) ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),padding: EdgeInsets.all(8)),onPressed:() {
                        Navigator.pushNamed(context, ImageClassificationDesign.routeName);
                      }, child:Text('Start Scanning',style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin:EdgeInsets.symmetric(vertical: 15),
                      child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Color.fromRGBO(25, 154, 142, 1) ,shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),padding: EdgeInsets.all(8)), onPressed:() {
                        Navigator.pushNamed(context, AboutUsScreen.routeName);
                      }, child:Text('About Us',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold)))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin:EdgeInsets.symmetric(vertical: 15),
                      child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Color.fromRGBO(25, 154, 142, 1) ,shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),padding: EdgeInsets.all(8)), onPressed:() {
                        Navigator.pushNamed(context, HowToScan.routeName);
                      }, child:Text('How To Scan?',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold))))

                ]),
          )
            ,

          ],
          )

        ],
      ),
    );
  }
}
