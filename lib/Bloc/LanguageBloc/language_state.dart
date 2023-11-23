part of 'language_bloc.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}
class LanguageblocLoading extends LanguageState {}
class LanguageblocLoaded extends LanguageState {}
class LanguageblocError extends LanguageState {}