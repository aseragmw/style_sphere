import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/features/cart/domain/repositories/cart_repository.dart';

class RemoveItemFromCartUsecase {
  final CartRepository cartRepository;

  RemoveItemFromCartUsecase({required this.cartRepository});
  Future<Either<Failure, Unit>> call(String itemID) => cartRepository.removeItemFromCart(itemID);
}
