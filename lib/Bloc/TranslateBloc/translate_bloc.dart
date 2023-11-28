import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:translater/Repository/Api/translate_api.dart';
import 'package:translater/Repository/ModalClass/TranslateModel.dart';

part 'translate_event.dart';
part 'translate_state.dart';

class TranslateBloc extends Bloc<TranslateEvent, TranslateState> {
  TranslateApi translateApi=TranslateApi();
  late TranslateModel translateModel;
  TranslateBloc() : super(TranslateInitial()) {
    on<FetchTranslate>((event, emit)async{
      emit(TranslateblocLoading());
      try{

        translateModel =await translateApi.getTranslate(event.message,event.code);
        emit(TranslateblocLoaded());
      }catch(e){
        print(e);
        emit(TranslateblocError());
      }

    });
  }
}
