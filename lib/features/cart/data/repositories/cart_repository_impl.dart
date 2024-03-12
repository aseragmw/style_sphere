import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:style_sphere/features/cart/data/models/cart_item_model.dart';
import 'package:style_sphere/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});
  @override
  Future<Either<Failure, Unit>> addItemToCart(String itemID) async{
    try {
      await cartRemoteDataSource.addItemToCart(itemID);
      return const Right(unit);
    } catch (e) {
      return const Left(Failure(message: 'Adding item Failed, Try again later'));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeItemFromCart(String itemID)async {
     try {
      await cartRemoteDataSource.removeItemFromCart(itemID);
      return const Right(unit);
    } catch (e) {
      return const Left(Failure(message: 'Removing item Failed, Try again later'));
    }
  }

  @override
  Future<Either<Failure, List<CartItemModel>>> getAllCartItems() async{
    try {
      final items = await cartRemoteDataSource.getAllCartItems();
      return  Right(items);
    } catch (e) {
      return const Left(Failure(message: 'Getting cart items Failed, Try again later'));
    }
  }
}
