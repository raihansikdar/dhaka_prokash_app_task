import 'package:dhaka_prokash_app_task/controllers/special_top_content_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

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
        builder: (_specialTopContentController) {
          if(_specialTopContentController.isLoading){
            return Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
              itemCount: _specialTopContentController.specialTopContentList.length,
            itemBuilder: (context,index){
                var contentHeading = parse(_specialTopContentController.specialTopContentList[index].contentHeading ?? '');
                return ListTile(
                  title: Text(contentHeading.toString()),
                  subtitle: Text("আল নাসর-ইন্টার মায়ামির প্রেডিকশন কি"),
                );
            }, separatorBuilder: (context,index) => Divider(),
          );

        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        var document = parse(
            '<p style=\"text-align: justify;\"><strong>আগামীকাল দেশের বিভিন্ন স্থানে বিদ্যুৎ সরবরাহ বন্ধ থাকবে বলে জানিয়েছে পাওয়ার গ্রিড কোম্পানি অব বাংলাদেশ (পিজিসিবি)।</strong></p>\r\n<p style=\"text-align: justify;\">বৃহস্পতিবার (১ ফেব্রুয়ারি) এক বিজ্ঞপ্তিতে এ তথ্য জানিয়েছে সংস্থাটি।</p>\r\n<p style=\"text-align: justify;\">বিজ্ঞপ্তিতে জানানো হয়, শুক্রবার (২ ফেব্রুয়ারি) জিএমডি-ঈশ্বরদীর আওতাধীন ভাঙ্গুড়া ১৩২/৩৩ কেভি গ্রিড উপকেন্দ্রে ১৩২ কেভি মেইন বাসবার ও ১৩২ কেভি বাঘাবাড়ী-ভাঙ্গুড়া সার্কিট-১ এর বার্ষিক শিডিউল সংরক্ষণ কাজ সম্পন্ন করা হবে। সংরক্ষণ কাজের জন্য ভাঙ্গুড়া ১৩২/৩৩ কেভি গ্রিড উপকেন্দ্রে সকাল ৮টা থেকে বিকাল ৪ টা পর্যন্ত ১৩২ কেডি ও ৩৩ কেডি বাসবারে কোনো পাওয়ার থাকবে না। ফলে উক্ত সময়ে ভাঙ্গুড়া থানা ও তার পার্শ্ববর্তী এলাকাসমূহে পাবনা পল্লী বিদ্যুৎ সমিতি- ১ নিয়ন্ত্রিত অঞ্চলে সম্পূর্ণভাবে বিদ্যুৎ সরবরাহ বন্ধ থাকবে।</p>\r\n<p style=\"text-align: justify;\">গ্রাহকদের সাময়িক অসুবিধার জন্য পাওয়ার গ্রিড কোম্পানি অব বাংলাদেশ লিমিটেড (পিজিসিবি) কর্তৃপক্ষ আন্তরিকভাবে দুঃখিত।</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>');
        print(document.outerHtml);
      },

      ),
    );
  }
}


/*import 'package:dhaka_prokash_app_task/controllers/special_top_content_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

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
        builder: (_specialTopContentController) {
          if(_specialTopContentController.isLoading){
            return Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            itemCount: _specialTopContentController.specialTopContentList.length,
            itemBuilder: (context, index) {
              final content = _specialTopContentController.specialTopContentList[index];
              return ListTile(
                title: Text(content.contentHeading ?? ''),
                subtitle: Html(data: content.contentDetails ?? ''), // Use Html widget for displaying HTML content
              );
            },
            separatorBuilder: (context, index) => Divider(),
          );
        },
      ),
    );
  }
}*/
