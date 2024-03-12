import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:style_sphere/core/constants/cache_constants.dart';
import 'package:style_sphere/core/utils/cache_helper.dart';
import 'package:style_sphere/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> signup(String name, String email, String password);
  Future<Unit> logout();
  Future<Unit> resetPassword(String email);
}

class AuthRemoteDataSourceImplWithFirestore extends AuthRemoteDataSource {
  static final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel> login(String email, String password) async {
    final signInResult = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    UserModel user =
        UserModel(userID: signInResult.user!.uid, userEmail: signInResult.user!.email!, username: signInResult.user!.displayName!);
    CacheHelper.put(CURRENT_USER, user);
    return user;
  }

  @override
  Future<Unit> logout() async {
    await firebaseAuth.signOut();
    CacheHelper.remove(CURRENT_USER);
    return unit;
  }

  @override
  Future<UserModel> signup(String name, String email, String password) async {
    final signInResult = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await signInResult.user!.updateDisplayName(name);
      UserModel user =
        UserModel(userID: signInResult.user!.uid, userEmail: signInResult.user!.email!, username: signInResult.user!.displayName!);
    return user;
    
  }


  @override
  Future<Unit> resetPassword(String email)async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
    return unit;
  }

}
