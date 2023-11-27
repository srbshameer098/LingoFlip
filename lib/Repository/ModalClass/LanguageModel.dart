class LanguageModel {
  LanguageModel({
    this.code,
    this.language,
  });

  LanguageModel.fromJson(dynamic json) {
    code = json['code'];
    language = json['language'];
  }

  dynamic code;
  dynamic language;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['language'] = language;
    return map;
  }

  static List<LanguageModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => LanguageModel.fromJson(value)).toList();
  }
}
