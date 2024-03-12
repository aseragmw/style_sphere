import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:style_sphere/features/auth/data/models/user_model.dart';
import 'package:style_sphere/features/auth/domain/repositories/auth_repository.dart';


class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, UserModel>> login(String email, String password) async {
    try {
      final user = await authRemoteDataSource.login(email, password);
      return Right(user);
    } catch (e) {
      log("error fel login");
      return const Left(Failure(message: 'Login Failed, Try again later'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await authRemoteDataSource.logout();
      return const Right(unit);
    } catch (e) {
      return const Left(Failure(message: 'Logout Failed, Try again later'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp(String name, String email, String password) async {
    try {
      final user = await authRemoteDataSource.signup(name, email, password);
      return Right(user);
    } catch (e) {
      return const Left(Failure(message: 'Signup Failed, Try again later'));
    }
  }

  
  
  @override
  Future<Either<Failure, Unit>> resetPassword(String email) async{
    try {
      await authRemoteDataSource.resetPassword(email);
      return const Right(unit);
    } catch (e) {
      return const Left(Failure(message: 'Resetting Password Failed, Try again later'));
    }
  }
}
