class Meal {
  final String image;
  final String title;
  final String kcal;
  final String time;
  final String mealType;

  Meal({
    required this.image,
    required this.title,
    required this.kcal,
    required this.time,
    required this.mealType,
  });

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'kcal': kcal,
      'time': time,
      'mealType': mealType,
    };
  }
  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      image: json['image'],
      title: json['title'],
      kcal: json['kcal'],
      time: json['time'],
      mealType: json['mealType'],
    );
  }

}