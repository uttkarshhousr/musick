import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpCubit extends Cubit<bool> {
  final FirebaseAuth _firebaseAuth;

  SignUpCubit(this._firebaseAuth) : super(false);

  Future<void> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("sign up  success   for " + email+ " " + password);
      emit(true); // Sign up successful
    } catch (e) {
      emit(false); // Sign up failed
    }
  }
}
