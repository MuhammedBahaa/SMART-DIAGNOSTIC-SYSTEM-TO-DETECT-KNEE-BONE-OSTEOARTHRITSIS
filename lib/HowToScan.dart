import 'package:flutter/material.dart';
import 'package:untitled1/ScanningScreen.dart';

class HowToScan extends StatelessWidget {
  static const String routeName = 'HowToScan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(25, 154, 142, 1),
        title: Text('How to scan',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
      ),
      body: Column(children: [
        SizedBox(height: 35,),
        Container(
        margin: EdgeInsets.all(10),

          child: Text(
            '• We recommend uploading a soft copy of your knee X-ray for better results.',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),

          child: Text(
            '• You can either choose to upload an image or take a photo of an X-ray.  ',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Text(
            '• In case you chose you take a photo place an X-ray image in a good lightning position and as clear as possible. ',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),

          child: Text(
            '• Try to fit the X-ray photo into the whole screen and avoid any uncalled for objects to appear.',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),

          child: Text(
            '• After picking your photo and confirming it, submit the X-ray for scanning and wait for your results!',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),SizedBox(height: 30,),
        Container(
            child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Color.fromRGBO(25, 154, 142, 1) ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),padding: EdgeInsets.all(12)),onPressed:() {
              Navigator.pushNamed(context, ImageClassificationDesign.routeName);
            }, child:Text('Lets try it!',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),)))
    ]),
    );
  }
}
