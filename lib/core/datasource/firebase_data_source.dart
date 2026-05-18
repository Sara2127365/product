import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:product/feature/auth/models/user_model.dart';
import 'package:product/feature/home/models/meal.dart';



class FirebaseDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUp(String email, String password, String name) async {
    UserCredential userCredential = await _auth
        .createUserWithEmailAndPassword(email: email, password: password);

    await _firestore.collection('users').doc(userCredential.user!.uid).set(
      UserModel(
        email: email,
        name: name,
        fav: [],
        password: password,
      ).toMap(),
    );
  }

  Future<void> addData() async {
    final List<Meal> mealsData = [
      Meal(
        title: 'Avocado Toast with Eggs',
        kcal: '350 kcal',
        time: '10 min',
        mealType: 'Breakfast',
        image:
        'https://images.unsplash.com/photo-1541519227354-08fa5d50c44d?w=800',
      ),
      Meal(
        title: 'Greek Yogurt Parfait',
        kcal: '280 kcal',
        time: '5 min',
        mealType: 'Breakfast',
        image:
        'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=800',
      ),
      Meal(
        title: 'Oatmeal Bowl',
        kcal: '320 kcal',
        time: '8 min',
        mealType: 'Breakfast',
        image:
        'https://images.unsplash.com/photo-1517673132405-a56a62b18caf?w=800',
      ),
      Meal(
        title: 'Grilled Chicken Salad',
        kcal: '420 kcal',
        time: '15 min',
        mealType: 'Lunch',
        image:
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800',
      ),
      Meal(
        title: 'Quinoa Buddha Bowl',
        kcal: '480 kcal',
        time: '20 min',
        mealType: 'Lunch',
        image:
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800',
      ),
      Meal(
        title: 'Turkey Wrap',
        kcal: '390 kcal',
        time: '10 min',
        mealType: 'Lunch',
        image:
        'https://images.unsplash.com/photo-1626700051175-6818013e1d4f?w=800',
      ),
      Meal(
        title: 'Grilled Salmon with Vegetables',
        kcal: '520 kcal',
        time: '25 min',
        mealType: 'Dinner',
        image:
        'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=800',
      ),
      Meal(
        title: 'Chicken Stir Fry',
        kcal: '460 kcal',
        time: '20 min',
        mealType: 'Dinner',
        image:
        'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=800',
      ),
      Meal(
        title: 'Grilled Steak',
        kcal: '580 kcal',
        time: '30 min',
        mealType: 'Dinner',
        image:
        'https://images.unsplash.com/photo-1558030006-450675393462?w=800',
      ),
    ];

    for (Meal meal in mealsData) {
      await _firestore.collection('meals').add(meal.toJson());
    }
  }

  Future<List<Meal>> getData() async {
    List<Meal> meals = [];
    try {
      QuerySnapshot querySnapshot =
      await _firestore.collection('meals').get();
      for (var i in querySnapshot.docs) {
        meals.add(Meal.fromJson(i.data() as Map<String, dynamic>));
      }
      return meals;
    } catch (e) {
      print(e);
      return [];
    }
  }
}