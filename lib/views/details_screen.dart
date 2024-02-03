import 'package:dhaka_prokash_app_task/controllers/special_top_content_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  final String image;
  final String contentHeading;
  final String contentDetails;
  final int contentId;
  const DetailsScreen({Key? key, required this.image, required this.contentHeading, required this.contentDetails, required this.contentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Details Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: contentId,
                  child: Image.network(
                    image,
                    // width: 100,
                    // height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8.0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(contentHeading,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                ),
                const SizedBox(height: 4.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(contentDetails,textAlign: TextAlign.justify,),
                      const SizedBox(height: 4.0,),
        
                    ],
                  ),
                ),
              ],
            ),
      )

    );
  }
}
