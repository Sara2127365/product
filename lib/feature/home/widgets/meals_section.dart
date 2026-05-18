import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/feature/home/cubit/home_cubit.dart';
import 'package:product/feature/home/cubit/home_state.dart';


import 'meal_card.dart';

class MealsSection extends StatelessWidget {
  const MealsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccessState) {
          final meals = state.meals;

          return Expanded(
            child: GridView.builder(
              itemCount: meals.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return MealCard(meal: meals[index]);
              },
            ),
          );
        }

        if (state is HomeLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is HomeErrorState) {
          return Center(child: Text(state.message));
        }

        return const SizedBox();
      },
    );
  }
}