import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/features/profile/domain/repositories/profile_repository.dart';

class ChangePasswordUsecase {
  final ProfileRepository profileRepository;

  ChangePasswordUsecase({required this.profileRepository});

  Future<Either<Failure, Unit>> call(String password) => profileRepository.changePassword(password);
}
