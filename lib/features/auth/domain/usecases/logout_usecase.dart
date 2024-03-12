import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/features/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository authRepository;

  LogoutUsecase({required this.authRepository});
  Future<Either<Failure, Unit>> call() => authRepository.logout();
}
