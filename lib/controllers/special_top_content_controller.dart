import 'package:dhaka_prokash_app_task/models/special_top_content.dart';
import 'package:dhaka_prokash_app_task/services/network_caller.dart';
import 'package:dhaka_prokash_app_task/services/network_response.dart';
import 'package:get/get.dart';

class SpecialTopContentController extends GetxController{
  bool _isLoading = false;
  String _errorMessage = '';
  List<SpecialTopContentModel> _specialTopContentList = [];

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  List<SpecialTopContentModel> get specialTopContentList => _specialTopContentList;


  Future<bool>getTopContent()async{
    _isLoading = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest('https://dhakaprokash24.com/api/prismaapi/home/specialtopcontent');
    _isLoading = false;

    if(response.isSuccess){
      final List<dynamic> responseData = response.body;
      _specialTopContentList = responseData.map((json) => SpecialTopContentModel.fromJson(json)).toList();
      update();
      return true;
    }else{
      _errorMessage = 'Fetch data failed';
      update();
      return false;
    }
  }
  
}