class LanguageModel {
  LanguageModel({
      this.code, 
      this.language,});

  LanguageModel.fromJson(dynamic json) {
    code = json['code'];
    language = json['language'];
  }
  String? code;
  String? language;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['language'] = language;
    return map;
  }

}