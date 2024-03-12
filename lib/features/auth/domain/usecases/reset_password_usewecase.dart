import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUsecase {
  final AuthRepository authRepository;

  ResetPasswordUsecase({required this.authRepository});
  Future<Either<Failure, Unit>> call(String email) => authRepository.resetPassword(email);
}
