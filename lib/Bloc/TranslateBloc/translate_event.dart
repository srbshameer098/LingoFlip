part of 'translate_bloc.dart';

@immutable
abstract class TranslateEvent {}
class FetchTranslate extends TranslateEvent{
  final String message;
  final String code;
  FetchTranslate({required this.message,required this.code});
}