import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/core/datasource/firebase_data_source.dart';
import 'package:product/feature/auth/cubit/state_auth.dart';

class CubitAuth extends Cubit<StateAuth> {
  CubitAuth() : super(InitalStateLogin());

  FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  Future<void> signUp(String email, String password, String name) async {
    emit(UploadingStateSignUp());

    try {
      await firebaseDataSource.signUp(email, password, name);
      emit(SuccessStateSignUp(message: 'success'));
    } catch (e) {
      emit(FailStateSignUp(message: 'fail'));
    }
  }

  Future<void> login(String email, String password) async {
    emit(UploadingStateLogin());

    try {
      await firebaseDataSource.login(email, password);
      emit(SuccessStateLogin(message: 'success'));
    } catch (e) {
      emit(FailStateLogin(message: 'fail'));
    }
  }
}
