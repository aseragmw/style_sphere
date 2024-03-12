import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/features/auth/domain/entities/user_entitiy.dart';


abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email,String password);
  Future<Either<Failure, UserEntity>> signUp(String name,String email,String password);
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, Unit>> resetPassword(String email);
}
