class TranslateModel {
  TranslateModel({
      this.trans, 
      this.sourceLanguageCode, 
      this.sourceLanguage, 
      this.trustLevel, 
      this.dict,});

  TranslateModel.fromJson(dynamic json) {
    trans = json['trans'];
    sourceLanguageCode = json['source_language_code'];
    sourceLanguage = json['source_language'];
    trustLevel = json['trust_level'];
    if (json['dict'] != null) {
      dict = [];
      json['dict'].forEach((v) {
        dict?.add(Dict.fromJson(v));
      });
    }
  }
  String? trans;
  String? sourceLanguageCode;
  String? sourceLanguage;
  int? trustLevel;
  List<Dict>? dict;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['trans'] = trans;
    map['source_language_code'] = sourceLanguageCode;
    map['source_language'] = sourceLanguage;
    map['trust_level'] = trustLevel;
    if (dict != null) {
      map['dict'] = dict?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Dict {
  Dict({
      this.pos, 
      this.terms, 
      this.entry, 
      this.baseForm, 
      this.posEnum,});

  Dict.fromJson(dynamic json) {
    pos = json['pos'];
    terms = json['terms'] != null ? json['terms'].cast<String>() : [];
    if (json['entry'] != null) {
      entry = [];
      json['entry'].forEach((v) {
        entry?.add(Entry.fromJson(v));
      });
    }
    baseForm = json['base_form'];
    posEnum = json['pos_enum'];
  }
  String? pos;
  List<String>? terms;
  List<Entry>? entry;
  String? baseForm;
  int? posEnum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pos'] = pos;
    map['terms'] = terms;
    if (entry != null) {
      map['entry'] = entry?.map((v) => v.toJson()).toList();
    }
    map['base_form'] = baseForm;
    map['pos_enum'] = posEnum;
    return map;
  }

}

class Entry {
  Entry({
      this.word, 
      this.reverseTranslation, 
      this.score,});

  Entry.fromJson(dynamic json) {
    word = json['word'];
    reverseTranslation = json['reverse_translation'] != null ? json['reverse_translation'].cast<String>() : [];
    score = json['score'];
  }
  String? word;
  List<String>? reverseTranslation;
  double? score;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['word'] = word;
    map['reverse_translation'] = reverseTranslation;
    map['score'] = score;
    return map;
  }

  getTranslate() {}
}