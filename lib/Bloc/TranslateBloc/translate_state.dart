part of 'translate_bloc.dart';

@immutable
abstract class TranslateState {}

class TranslateInitial extends TranslateState {}
class TranslateblocLoading extends TranslateState {}
class TranslateblocLoaded extends TranslateState {}
class TranslateblocError extends TranslateState {}
