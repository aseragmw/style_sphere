import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/features/cart/domain/entities/cart_item_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, Unit>> addItemToCart(String itemID);
  Future<Either<Failure, Unit>> removeItemFromCart(String itemID);
  Future<Either<Failure, List<CartItemEntity>>> getAllCartItems();
}
