// Karim Toson || kareemtoson1@gmail.com || Mon May 04 2026 18:42:47

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/core/datasource/firebase_data_source.dart';

import 'package:product/feature/home/cubit/home_state.dart';
import 'package:product/feature/home/models/meal.dart';

class HomeCubit extends Cubit<HomeState> {
  FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  HomeCubit() : super(HomeInitialState());

  List<Meal> meals = [];
  List<Meal> filtedMeals = [];

  //get all date
  Future<void> getData() async {
    emit(HomeLoadingState());

    try {
      meals = await firebaseDataSource.getData();
      emit(HomeSuccessState(meals));
      print(meals);
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  //get filterd data

  void getFiltedData(String mealType) {
    emit(HomeLoadingState());
    try {
      filtedMeals = meals.where((mealItem) {
        return mealItem.mealType == mealType;
      }).toList();
      emit(HomeSuccessState(filtedMeals));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}