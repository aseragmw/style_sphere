import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/features/profile/domain/entities/shipping_address_enitiy.dart';
import 'package:style_sphere/features/profile/domain/repositories/profile_repository.dart';

class UpdatePersonalInfoUsecase {
  final ProfileRepository profileRepository;

  UpdatePersonalInfoUsecase({required this.profileRepository});

  Future<Either<Failure, Unit>> call(String key,String value) => profileRepository.updatePersonalInfo(key, value);
}
