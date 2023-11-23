part of 'translate_bloc.dart';

@immutable
abstract class TranslateEvent {}
class FetchTranslate extends TranslateEvent{
  final String message;
  FetchTranslate({required this.message});
}