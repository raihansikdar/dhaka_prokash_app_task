import 'dart:convert';

import 'package:dhaka_prokash_app_task/controllers/special_top_content_controller.dart';
import 'package:dhaka_prokash_app_task/views/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;
import 'package:html_unescape/html_unescape.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<SpecialTopContentController>().getTopContent();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Home Screen"),
      ),
      body: GetBuilder<SpecialTopContentController>(
          builder: (specialTopContentController) {
            if (specialTopContentController.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: specialTopContentController.specialTopContentList.length,
              itemBuilder: (context, index) {
                var unescape = HtmlUnescape();
                var document= parse(utf8.decode(specialTopContentController.specialTopContentList[index].contentHeading!.codeUnits));
                String parsedString = unescape.convert(document.body?.text ?? '');


                var contentDetails = convertText(specialTopContentController.specialTopContentList[index].contentDetails!);
                var bnCatName = convertText(specialTopContentController.specialTopContentList[index].bnCatName!);
                var createdAt = convertText(specialTopContentController.specialTopContentList[index].createdAt!);

                // Initialize the internationalization settings with Bengali locale
                initializeDateFormatting("bn", null);

                // Parse the API date string
                DateTime parsedDate = DateTime.parse(createdAt);

                // Calculate the time difference
                Duration difference = DateTime.now().difference(parsedDate);

                // Format the difference in a custom way
                String formattedDifference = formatTimeDifference(difference);

                return GestureDetector(
                  onTap: (){
                    Get.to(() => DetailsScreen(
                      image:
                          'https://admin.dhakaprokash24.com/media/content/images/${specialTopContentController.specialTopContentList[index].imgBgPath}',
                      contentHeading: parsedString,
                      contentDetails: contentDetails,
                      contentId: specialTopContentController.specialTopContentList[index].contentId!,
                    ),transition:  Transition.rightToLeft,duration: Duration(milliseconds: 800));
              },
                  child: Card(
                    elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: specialTopContentController.specialTopContentList[index].contentId!,
                          child: Image.network(
                            'https://admin.dhakaprokash24.com/media/content/images/${specialTopContentController.specialTopContentList[index].imgBgPath}',
                            // width: 100,
                            // height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8.0,),
                        Text(parsedString,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 4.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(contentDetails,maxLines: 3,style: const TextStyle(overflow: TextOverflow.ellipsis),),
                            const SizedBox(height: 4.0,),
                           Row(
                             children: [
                               Text(formattedDifference),
                               SizedBox(width: 8.0,),
                               //Text(bnCatName),
                             ],
                           )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // var document = parse(
      //     //     '<p style=\"text-align: justify;\"><strong>আগামীকাল দেশের বিভিন্ন স্থানে বিদ্যুৎ সরবরাহ বন্ধ থাকবে বলে জানিয়েছে পাওয়ার গ্রিড কোম্পানি অব বাংলাদেশ (পিজিসিবি)।</strong></p>\r\n<p style=\"text-align: justify;\">বৃহস্পতিবার (১ ফেব্রুয়ারি) এক বিজ্ঞপ্তিতে এ তথ্য জানিয়েছে সংস্থাটি।</p>\r\n<p style=\"text-align: justify;\">বিজ্ঞপ্তিতে জানানো হয়, শুক্রবার (২ ফেব্রুয়ারি) জিএমডি-ঈশ্বরদীর আওতাধীন ভাঙ্গুড়া ১৩২/৩৩ কেভি গ্রিড উপকেন্দ্রে ১৩২ কেভি মেইন বাসবার ও ১৩২ কেভি বাঘাবাড়ী-ভাঙ্গুড়া সার্কিট-১ এর বার্ষিক শিডিউল সংরক্ষণ কাজ সম্পন্ন করা হবে। সংরক্ষণ কাজের জন্য ভাঙ্গুড়া ১৩২/৩৩ কেভি গ্রিড উপকেন্দ্রে সকাল ৮টা থেকে বিকাল ৪ টা পর্যন্ত ১৩২ কেডি ও ৩৩ কেডি বাসবারে কোনো পাওয়ার থাকবে না। ফলে উক্ত সময়ে ভাঙ্গুড়া থানা ও তার পার্শ্ববর্তী এলাকাসমূহে পাবনা পল্লী বিদ্যুৎ সমিতি- ১ নিয়ন্ত্রিত অঞ্চলে সম্পূর্ণভাবে বিদ্যুৎ সরবরাহ বন্ধ থাকবে।</p>\r\n<p style=\"text-align: justify;\">গ্রাহকদের সাময়িক অসুবিধার জন্য পাওয়ার গ্রিড কোম্পানি অব বাংলাদেশ লিমিটেড (পিজিসিবি) কর্তৃপক্ষ আন্তরিকভাবে দুঃখিত।</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>');
      //     // print(document.outerHtml);
      //   },
      // ),
    );
  }

   dynamic convertText(var data){
    var unescape = HtmlUnescape();
    var document = parse(utf8.decode(data.codeUnits));
    String parsedString = unescape.convert(document.body?.text ?? '');
    return parsedString;
  }
  // String formatTimeDifference(Duration difference) {
  //   // Convert the difference to hours and minutes
  //   int hours = difference.inHours;
  //   int minutes = difference.inMinutes % 60;
  //
  //   // Construct the formatted string
  //   if (hours > 0) {
  //     return '$hours ঘণ্টা আগে';
  //   } else {
  //     return '$minutes মিনিট আগে';
  //   }
  // }
  String formatTimeDifference(Duration difference) {
    // Convert the difference to hours and minutes
 /*
    intl: ^0.18.0
    intl_translation: ^0.18.1
  */
    int hours = difference.inHours;
    int minutes = difference.inMinutes % 60;

    // Get the locale-specific number format for Bengali
    var numberFormat = NumberFormat("#,##0", "bn");

    // Format the hours and minutes using Bengali digits
    String formattedHours = numberFormat.format(hours);
    String formattedMinutes = numberFormat.format(minutes);

    // Construct the formatted string
    if (hours > 0) {
      return '$formattedHours ঘণ্টা আগে';
    } else {
      return '$formattedMinutes মিনিট আগে';
    }
  }
}


