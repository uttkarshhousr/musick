import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationCubit extends Cubit<AuthenticationStatus> {
  final FirebaseAuth _firebaseAuth;

  AuthenticationCubit(this._firebaseAuth) : super(AuthenticationStatus.unknown);

  void appStarted() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        emit(AuthenticationStatus.authenticated);
      } else {
        emit(AuthenticationStatus.unauthenticated);
      }
    } catch (e) {
      emit(AuthenticationStatus.unauthenticated);
    }
  }

  void loggedIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthenticationStatus.authenticated);
    } catch (e) {
      // Handle authentication failure
      print("failed to sign in");
      emit(AuthenticationStatus.unauthenticated);
    }
  }

  void loggedOut() {
    _firebaseAuth.signOut();
    emit(AuthenticationStatus.unauthenticated);
  }
}
