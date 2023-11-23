import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:translater/Repository/Api/language_api.dart';
import 'package:translater/Repository/ModalClass/LanguageModel.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageApi languageApi=LanguageApi();
  late LanguageModel languageModel;
  LanguageBloc() : super(LanguageInitial()) {
    on<LanguageEvent>((event, emit) async{
      emit(LanguageblocLoading());
      try{
        languageModel = await languageApi.getLanguage();
        emit(LanguageblocLoaded());
      }catch(e){
        print(e);
        emit(LanguageblocError());
      }
      // TODO: implement event handler
    });
  }
}
