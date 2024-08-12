import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/features/profile/domain/entities/shipping_address_enitiy.dart';
import 'package:style_sphere/features/profile/domain/repositories/profile_repository.dart';

class RemoveShippingAddressUsecase {
  final ProfileRepository profileRepository;

  RemoveShippingAddressUsecase({required this.profileRepository});

  Future<Either<Failure, Unit>> call(ShippingAddressEntity address) => profileRepository.removeShippingAddress(address);
}
