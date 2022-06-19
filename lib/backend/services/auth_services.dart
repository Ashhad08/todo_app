import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  // CreateUser or Signup or register
  Future<UserCredential> signUpUser(
      {required String email, required String password}) async {
    return await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  // login or signIn
  Future<UserCredential> signInUser(
      {required String email, required String password}) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
// forgot password
  Future<void> forgotPassword({required String email}) async {
    return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
