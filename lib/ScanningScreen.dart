// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tflite/tflite.dart';
//
// class TfliteModel extends StatefulWidget {
//   static const String routeName='TfliteModel';
//   const TfliteModel({Key? key}) : super(key: key);
//
//   @override
//   State<TfliteModel> createState() => _TfliteModelState();
// }
//
// class _TfliteModelState extends State<TfliteModel> {
//   late File _image;
//   late List _results;
//   bool imageSelect=false;
//   void initState(){
//     super.initState();
//     loadModel();
//   }
//   Future loadModel() async {
//     Tflite.close();
//     String res;
//     res= (await Tflite.loadModel(model:"flutter_assets/model.tflite", labels:"flutter_assets/label.txt" ))!;
//     print("models loading status: $res");
//   }
//   Future imageClassification(File image) async {
//     var recognitions = await Tflite.runModelOnImage(
//       path: image.path,
//       numResults: 1,
//       threshold: 0.50,
//       imageMean: 127.5,
//       imageStd: 127.5,
//       asynch: true,
//
//     );
//     setState(() {
//       _results=recognitions!;
//       _image=image;
//       imageSelect=true;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Image classification"),
//       ),
//       body: ListView(
//         children: [
//           (imageSelect)?Container(
//             margin: const EdgeInsets.all(10),
//             child: Image.file(_image),
//           ):Container(
//             margin:const EdgeInsets.all(10) ,
//             child: const Opacity(
//               opacity: 0.8,
//               child: Center(
//                 child: Text("No image selected"),
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Column(
//               children: (imageSelect)?_results.map((results) {
//                 return Card(
//                   child: Container(
//                     margin: const EdgeInsets.all(10),
//                     child: Text(
//                       "${results['label']} - ${results['confidence'].toStringAsFixed(3)}",
//                       style: const TextStyle(color: Colors.red,
//                           fontSize: 20
//                       ),
//                     ),
//                   ),
//                 );
//               }).toList():[],
//             ),
//           )
//         ],
//
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: pickImage,
//         tooltip: "Pick Image",
//         child: const Icon(Icons.image),
//       ),
//
//     );
//   }
//   Future pickImage()
//   async{
//     final ImagePicker _picker = ImagePicker();
//     final XFile? pickedFile = await _picker.pickImage(
//       source: ImageSource.gallery,
//       maxWidth: 224,
//       maxHeight:224,
//
//     );
//     File image=File(pickedFile!.path);
//     imageClassification(image);
//   }
// }
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:image/image.dart' as img;
import 'dart:ui' as ui;

import 'Treatments.dart';


class ImageClassificationDesign extends StatefulWidget {
  static const String routeName='ImageClassificationDesign';
  const ImageClassificationDesign({Key? key}) : super(key: key);

  @override
  State<ImageClassificationDesign> createState() => _ImageClassificationDesign();
}

class _ImageClassificationDesign extends State<ImageClassificationDesign> {
  late File _image;
  late List _results;
  bool imageSelect=false;
  bool isLoading = false;
  void initState(){
    super.initState();
    loadModel();
  }
  Future<File> resizeAndSaveImage(File originalImageFile, String filePath, int width, int height) async {
    // Read the image from the original file
    Uint8List imageBytes = await originalImageFile.readAsBytes();
    img.Image? originalImage = img.decodeImage(imageBytes);

    // Resize the image to the specified dimensions
    img.Image resizedImage = img.copyResize(originalImage!, width: width, height: height);

    // Save the resized image to the specified file path
    File resizedImageFile = File(filePath);
    originalImageFile.writeAsBytesSync(img.encodePng(resizedImage));
    return resizedImageFile;
  }
  Future loadModel() async {
    Tflite.close();
    String res;
    res= (await Tflite.loadModel(model:"flutter_assets/model.tflite", labels:"flutter_assets/label.txt" ))!;
    print("models loading status: $res");
  }
  Future imageClassification(File image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.06,
       // imageMean: 0.4,
       // imageStd: 0.225,
      asynch: true,

    );
    setState(() {
      _results=recognitions!;
      _image=image;
      imageSelect=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(25, 154, 142, 1),
        title: Text(imageSelect?"Results":'Scanning',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26))
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            isLoading
                ?const Center(child: CircularProgressIndicator(color: Color(0xff199A8E),),)
                :(imageSelect)? Container(
              width: double.infinity,
              height: 224,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
              ),
              margin: const EdgeInsets.all(10),
              child: Image.file(_image),
            ):Container(
              margin:const EdgeInsets.all(10) ,
              height: 100,
              child: const Opacity(
                opacity: .9,
                child: Center(
                  child: Text("No image selected",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            (imageSelect) ? SizedBox(height: 1,):SizedBox(height:150),
            Text('  Result:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
            Container(
              width: double.infinity,
              height: 224,
              decoration: BoxDecoration(
                color: Color(0xffD5DDE0),
                borderRadius: BorderRadius.circular(27),
              ),
              margin: const EdgeInsets.all(10),
              child: isLoading?const Center(child: CircularProgressIndicator(color: Color(0xff199A8E),),):Center(
                child: (imageSelect)? SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: (imageSelect)?_results.map((results) {
                          return Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Text(
                                "${results['label']} - ${results['confidence'].toStringAsFixed(2)}",
                                style: const TextStyle(color: Color(0xff199A8E),
                                    fontSize: 27
                                ),
                              ),
                            ),
                          );
                        }).toList():[],
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin:EdgeInsets.symmetric(vertical: 15),
                          child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Color.fromRGBO(25, 154, 142, 1) ,shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),padding: EdgeInsets.all(8)), onPressed:() {
                            Navigator.pushNamed(context, TreatmentScreen.routeName,arguments: _results[0]['label'] as String);
                          }, child:Text('Show Treatment',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold))))
                    ],
                  ),
                ):Center(child: Text('Upload image or take image to get result',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xff199A8E)),),),
              ) ,
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      pickImage1();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(25, 154, 142, 1) ,
                      ),
                      child: Center(
                        child:Row(
                          children: [
                            Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(width: 2,),
                            Expanded(child: Text('Take image ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                /*CircleAvatar(
                  radius: 25,
                  backgroundColor: CupertinoColors.activeGreen,
                  child: IconButton(
                    onPressed: (){
                      pickImage1();
                    },
                    icon: Icon(Icons.camera_alt_outlined,color: Colors.white,),
                  ),
                ),*/
                SizedBox(width: 10,),

                Expanded(
                  child: InkWell(
                    onTap: (){
                      pickImage();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(25, 154, 142, 1) ,
                      ),


                      child: Center(
                        child:Row(
                          children: [
                            Icon(
                              Icons.image,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(width: 2,),
                            Text('Upload image',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],

        ),
      ),
    );
  }
  Future pickImage()
  async{
    setState(() {
      isLoading = true;
    });
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 250,
      maxHeight:200,

    );
    File image=File(pickedFile!.path);
    imageClassification(await resizeAndSaveImage(
        image,
       image.path,
        224,
        224
    )).then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }
  Future pickImage1()
  async{
    setState(() {
      isLoading = true;
    });
    final ImagePicker _picker1 = ImagePicker();
    final XFile? pickedFile = await _picker1.pickImage(
      source: ImageSource.camera,
      maxWidth: 250,
      maxHeight:200,

    );
    File image=File(pickedFile!.path);
    imageClassification(await resizeAndSaveImage(
        image,
        image.path,
        224,
        224
    )).then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }
}