import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/core/shared_models/order/order_enitity.dart';
import 'package:style_sphere/features/profile/domain/repositories/profile_repository.dart';

class GetOrdersUsecase {
  final ProfileRepository profileRepository;

  GetOrdersUsecase({required this.profileRepository});

  Future<Either<Failure, List<OrderEntity>>> call(String key) => profileRepository.getOrders(key);
}
