import 'dart:convert';

import 'package:dhaka_prokash_app_task/controllers/special_top_content_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;
import 'package:html_unescape/html_unescape.dart';

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
                var document = parse(utf8.decode(specialTopContentController.specialTopContentList[index].contentHeading!.codeUnits));
                String parsedString = unescape.convert(document.body?.text ?? '');

                var unescape2 = HtmlUnescape();
                var document2 = parse(utf8.decode(specialTopContentController.specialTopContentList[index].contentDetails!.codeUnits));
                String parsedString2 = unescape2.convert(document2.body?.text ?? '');

                var unescape3 = HtmlUnescape();
                var document3 = parse(utf8.decode(specialTopContentController.specialTopContentList[index].bnCatName!.codeUnits));
                String parsedString3 = unescape3.convert(document3.body?.text ?? '');
                print("======================================>");
                print('https://dhakaprokash24.com/api/${specialTopContentController.specialTopContentList[index].imgBgPath}');
               
                return ListTile(
                 // leading: Image.network('https://dhakaprokash24.com/api/prismaapi/home/specialtopcontent/${specialTopContentController.specialTopContentList[index].imgBgPath}'),

                  leading: Image.network(
                    'https://dhakaprokash24.com/api/${specialTopContentController.specialTopContentList[index].imgBgPath}',

                    width: 60, // Adjust as needed
                    height: 60, // Adjust as needed
                    fit: BoxFit.cover,
                  ),

                  title: Text(parsedString),
                  subtitle:  Column(
                    children: [
                      Text(parsedString2,maxLines: 3,),
                      Text(parsedString3),
                    ],
                  ),

                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // var document = parse(
          //     '<p style=\"text-align: justify;\"><strong>আগামীকাল দেশের বিভিন্ন স্থানে বিদ্যুৎ সরবরাহ বন্ধ থাকবে বলে জানিয়েছে পাওয়ার গ্রিড কোম্পানি অব বাংলাদেশ (পিজিসিবি)।</strong></p>\r\n<p style=\"text-align: justify;\">বৃহস্পতিবার (১ ফেব্রুয়ারি) এক বিজ্ঞপ্তিতে এ তথ্য জানিয়েছে সংস্থাটি।</p>\r\n<p style=\"text-align: justify;\">বিজ্ঞপ্তিতে জানানো হয়, শুক্রবার (২ ফেব্রুয়ারি) জিএমডি-ঈশ্বরদীর আওতাধীন ভাঙ্গুড়া ১৩২/৩৩ কেভি গ্রিড উপকেন্দ্রে ১৩২ কেভি মেইন বাসবার ও ১৩২ কেভি বাঘাবাড়ী-ভাঙ্গুড়া সার্কিট-১ এর বার্ষিক শিডিউল সংরক্ষণ কাজ সম্পন্ন করা হবে। সংরক্ষণ কাজের জন্য ভাঙ্গুড়া ১৩২/৩৩ কেভি গ্রিড উপকেন্দ্রে সকাল ৮টা থেকে বিকাল ৪ টা পর্যন্ত ১৩২ কেডি ও ৩৩ কেডি বাসবারে কোনো পাওয়ার থাকবে না। ফলে উক্ত সময়ে ভাঙ্গুড়া থানা ও তার পার্শ্ববর্তী এলাকাসমূহে পাবনা পল্লী বিদ্যুৎ সমিতি- ১ নিয়ন্ত্রিত অঞ্চলে সম্পূর্ণভাবে বিদ্যুৎ সরবরাহ বন্ধ থাকবে।</p>\r\n<p style=\"text-align: justify;\">গ্রাহকদের সাময়িক অসুবিধার জন্য পাওয়ার গ্রিড কোম্পানি অব বাংলাদেশ লিমিটেড (পিজিসিবি) কর্তৃপক্ষ আন্তরিকভাবে দুঃখিত।</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>');
          // print(document.outerHtml);
        },
      ),
    );
  }
}


