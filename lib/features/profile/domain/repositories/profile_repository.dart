import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/core/shared_models/order/order_enitity.dart';
import 'package:style_sphere/features/profile/domain/entities/shipping_address_enitiy.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Unit>> addShippingAddress(ShippingAddressEntity address);
  Future<Either<Failure, Unit>> removeShippingAddress(ShippingAddressEntity address);
  Future<Either<Failure, Unit>> editShippingAddress(ShippingAddressEntity address);
  Future<Either<Failure, Unit>> changePassword(String password);
  Future<Either<Failure, Unit>> updatePersonalInfo(String key, String value);
  Future<Either<Failure, List<OrderEntity>>> getOrders(String key);
}
