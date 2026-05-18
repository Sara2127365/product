// Karim Toson || kareemtoson1@gmail.com || Tue Apr 28 2026 19:37:53

import 'package:flutter/material.dart';
import 'package:product/feature/home/models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Image + Favorite
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  meal.image,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.favorite_border, size: 18),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 🔹 Title
          Text(
            meal.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          const Spacer(),

          // 🔹 Info Row
          Row(
            children: [
              const Icon(Icons.local_fire_department, size: 14),
              const SizedBox(width: 4),
              Text(meal.kcal),

              const SizedBox(width: 5),

              const Icon(Icons.access_time, size: 14),

              Text(meal.time),
            ],
          ),
        ],
      ),
    );
  }
}