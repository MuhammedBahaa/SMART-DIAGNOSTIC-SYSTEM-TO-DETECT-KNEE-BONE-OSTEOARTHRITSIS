import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ScanningScreen.dart';

class TreatmentScreen extends StatelessWidget {

  static const String routeName='TreatmentScreen';
  @override
  Widget build(BuildContext context) {
    String result = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.green,
      // ),
      body: SingleChildScrollView(
        child: Column(
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
                        Text(result,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),


                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 60,),
            Center(child: Text('Treatment description',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.grey),)),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Center(
                child: Column(
                  children: [
                    result == "Healthy Knee"
                        ? Column(
                      children: [
                        Text(
                          "If your knee is healthy and you want to prevent injury and maintain its health, there are several things you can do:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10), // add space between lines
                        Text(
                          "• Exercise regularly: Regular exercise can help strengthen the muscles around the knee joint and improve its stability and flexibility. Low-impact exercises like walking, swimming, cycling, and yoga are good options for maintaining knee health without putting too much stress on the joint.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10), // add space between lines
                        Text(
                          "• Maintain a healthy weight: Excess weight can put extra stress on the knee joint and increase the risk of injury and arthritis. Maintaining a healthy weight through a balanced diet and regular exercise can help reduce this risk.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10), // add space between lines
                        Text(
                          "• Wear appropriate footwear: Wearing shoes with good arch support and cushioning can help reduce the impact on the knee joint during activities like walking and running.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10), // add space between lines
                        Text(
                          "• Warm up and cool down: Before and after exercise, it's important to warm up and cool down properly to prevent injury. This can include stretching and doing low-intensity exercises to get the blood flowing and prepare the muscles for activity.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.start,
                          softWrap: true,
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "• Avoid repetitive stress: Repetitive stress on the knee joint, such as from running or jumping, can increase the risk of injury and arthritis. If you engage in these activities, it's important to take breaks and vary your routine to avoid overuse.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10),
                        Text(
                          '''• Protect your knees during sports and other activities: Wear protective gear like knee pads or braces during sports and other activities that put stress on the knee joint.\n\ By following these tips, you can help maintain the health of your knee joint and reduce the risk of injury and arthritis.''',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.start,
                          softWrap: true,
                        ),
                      ],
                    )
                        : result == "Moderate Arthritis"
                        ? Column(
                      children: [
                        Text(
                          "Any treatment plan should be tailored to each patient's severity of arthritis, age, lifestyle, and goals. Both non-surgical and surgical options should initially be explored, starting with the most conservative approaches like medications, physical therapy and lifestyle changes. Surgery should typically only be considered after more conservative treatments have failed to provide adequate relief.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10), // add space between lines
                        Text(
                          '''Here are some potential treatment options for the diagnosed knee X-ray:
• Weight loss if needed to reduce pressure on the knee
• Physical therapy focused on strengthening muscles around the knee and improving range of motion''',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10), // add space between lines
                        Text(
                          '''• Over the counter anti-inflammatories and pain relievers as needed
• Bracing or taping the knee for added support during activities
• Try viscosupplementation injections:
Injections of hyaluronic acid or other lubricating fluids into the knee joint. These can lubricate and cushion the joint, potentially relieving pain and improving function for 6-12 months.''',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10), // add space between lines
                        Text(
                          '''• Consider prolotherapy or platelet-rich plasma (PRP) injections: These involve injecting solutions that may stimulate the body's own healing response and help regrow cartilage. They have shown potential for relieving pain and slowing arthritis progression.''',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10), // add space between lines
                        Text(
                          '''• Surgery should be a last resort: For moderate arthritis, you may be able to delay joint replacement surgery longer through aggressive non-surgical treatments. Surgery would be considered if conservative options fail to control pain and decline in function.''',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.start,
                          softWrap: true,
                        ),
                      ],
                    )
                        : Column(
                      children: [
                        Text(
                          "Any treatment plan should be tailored to each patient's severity of arthritis, age, lifestyle, and goals. Both non-surgical and surgical options should initially be explored, starting with the most conservative approaches like medications, physical therapy and lifestyle changes. Surgery should typically only be considered after more conservative treatments have failed to provide adequate relief.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10), // add space between lines
                        Text(
                          "Here are some potential treatment options for the diagnosed knee X-ray:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10), // add space between lines
                        Text(
                          "• Medications: Anti-inflammatory medications like NSAIDs can help relieve pain and inflammation. corticosteroid injections into the knee joint may provide short-term relief.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10), // add space between lines
                        Text(
                          "• Physical therapy: Exercises and stretches can help improve range of motion, strength and mobility. Physical therapy modalities like heat, ice, and ultrasound may also be beneficial.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10), // add space between lines
                        Text(
                          "• Lifestyle changes: Weight loss if needed, low impact exercises instead of high impact, avoiding activities that cause knee pain. This treatment plan is only a suggestion based on the applications diagnosis & you should visit your local doctor as soon as possible.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.start,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

