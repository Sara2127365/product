// Karim Toson || kareemtoson1@gmail.com || Tue Apr 28 2026 19:23:43

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/core/styles/styles_manager.dart';
import 'package:product/feature/home/cubit/home_cubit.dart';
import 'package:product/feature/home/cubit/home_state.dart';
import 'package:product/feature/home/widgets/category_chip.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int selectedIndex = 0;

  final List<String> categories = ["Breakfast", "Lunch", "Dinner", "snacks"];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Category", style: StyleManager.titleText20Style),
            GestureDetector(
              onTap: () {},
              child: Text(
                "See All",
                style: StyleManager.titleText18StylePrimary,
              ),
            ),
          ],
        ),

        SizedBox(height: height * 0.02),

        // 🔹 Chips
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final myCubit = context.read<HomeCubit>();
            return SizedBox(
              height: height * 0.05,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryChip(
                    text: categories[index],
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      myCubit.getFiltedData(categories[index]);
                    },
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}