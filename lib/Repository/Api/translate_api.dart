



import 'dart:convert';

import 'package:http/http.dart';
import 'package:translater/Repository/Api/api_client.dart';
import 'package:translater/Repository/ModalClass/TranslateModel.dart';

class TranslateApi {
  ApiClient apiClient = ApiClient();


  Future<TranslateModel> getTranslate(String text) async {
    String trendingpath = 'https://google-translate113.p.rapidapi.com/api/v1/translator/text';
    var body = {
     "from":"auto",
      "to":"ml",
      "text":text,

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', body);

    return TranslateModel.fromJson(jsonDecode(response.body));
  }

}