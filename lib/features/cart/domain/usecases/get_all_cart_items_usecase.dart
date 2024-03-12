import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/features/cart/domain/entities/cart_item_entity.dart';
import 'package:style_sphere/features/cart/domain/repositories/cart_repository.dart';

class GetAllCartItemsUsecase {
  final CartRepository cartRepository;

  GetAllCartItemsUsecase({required this.cartRepository});
  Future<Either<Failure, List<CartItemEntity>>> call() => cartRepository.getAllCartItems();
}
