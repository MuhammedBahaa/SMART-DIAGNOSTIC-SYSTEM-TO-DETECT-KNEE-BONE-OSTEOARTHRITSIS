import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  static const String routeName='AboutUsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.green,
      // ),
      body: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff199A8E),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Row(


                    children: [
                      CircleAvatar(

                        radius:30,
                        backgroundImage:AssetImage('assets/images/knee-logo.jpg'),
                      ),
                      SizedBox(width: 7,),
                      Text('Smart Diagnostic system to detect \n Knee-Bone Osteoarthritis',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),


                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 60,),
          Center(child: Text('About Us',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.grey),)),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(child: Text(
              softWrap: true,
              'Knee arthritis affects millions of people worldwide, causing pain, stiffness and loss of mobility that diminishes quality of life. With ArthritisDetectorApp, our mission is to harness the power of technology to improve health outcomes for those living with this debilitating condition by giving early predictions & diagnosis of the state of the knee using improved deep learning models.',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                color: Colors.black,),textAlign: TextAlign.center,)),
          ),
          SizedBox(height: 150,),
          Center(child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Icon(Icons.accessibility_new_rounded,size: 30,color:Color(0xff199A8E) ,),
                backgroundColor: Colors.transparent,
                radius:20,
                //backgroundImage:AssetImage('assets/images/knee-logo.jpg'),
              ),
              Text('Thank you for using our app',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
            ],
          )),

        ],
      ),
    );
  }
}
