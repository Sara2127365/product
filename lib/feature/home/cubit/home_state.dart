import 'package:product/feature/home/models/meal.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<Meal> meals;

  HomeSuccessState( this.meals);
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState( this.message);

  
}
