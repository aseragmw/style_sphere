import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/features/auth/domain/entities/user_entitiy.dart';
import 'package:style_sphere/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase({required this.authRepository});
  Future<Either<Failure, UserEntity>> call(String email, String password) => authRepository.login(email, password);
}
