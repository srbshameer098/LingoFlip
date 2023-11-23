

import 'dart:convert';

import 'package:http/http.dart';
import 'package:translater/Repository/Api/api_client.dart';
import 'package:translater/Repository/ModalClass/LanguageModel.dart';

class LanguageApi {
ApiClient apiClient = ApiClient();


Future<LanguageModel> getLanguage() async {
  String trendingpath = 'https://google-translate113.p.rapidapi.com/api/v1/translator/support-languages';
  var body = {


  };
  Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

  return LanguageModel.fromJson(jsonDecode(response.body));
}

}