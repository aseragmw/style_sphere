import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/core/shared_models/order/order_enitity.dart';
import 'package:style_sphere/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:style_sphere/features/profile/domain/entities/shipping_address_enitiy.dart';
import 'package:style_sphere/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl({required this.profileRemoteDataSource});
  @override
  Future<Either<Failure, Unit>> addShippingAddress(ShippingAddressEntity address) async {
    try {
      await profileRemoteDataSource.addShippingAddress(address);
      return const Right(unit);
    } catch (e) {
      return const Left(Failure(message: 'Adding address Failed, Try again later'));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeShippingAddress(ShippingAddressEntity address) async {
    try {
      await profileRemoteDataSource.removeShippingAddress(address);
      return const Right(unit);
    } catch (e) {
      return const Left(Failure(message: 'Removing address Failed, Try again later'));
    }
  }

  @override
  Future<Either<Failure, Unit>> editShippingAddress(ShippingAddressEntity address) async {
    try {
       await profileRemoteDataSource.editShippingAddress(address);
      return const Right(unit);
    } catch (e) {
      return const Left(Failure(message: 'Editing address Failed, Try again later'));
    }
  }

  @override
  Future<Either<Failure, Unit>> changePassword(String password)async {
    try {
      final items = await profileRemoteDataSource.changePassword(password);
      return Right(items);
    } catch (e) {
      return const Left(Failure(message: 'Changing password Failed, Try again later'));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders(String key)async {
    try {
      final items = await profileRemoteDataSource.getOrders(key);
      return Right(items);
    } catch (e) {
      return  Left(Failure(message: 'Getting ${key} orders Failed, Try again later'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePersonalInfo(String key, String value)async {
   try {
       await profileRemoteDataSource.updatePresonalInfo(key, value);
      return const Right(unit);
    } catch (e) {
      return  Left(Failure(message: 'Updaing ${key} Failed, Try again later'));
    }
  }
}
