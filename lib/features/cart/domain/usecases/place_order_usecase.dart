import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/core/shared_models/order/order_enitity.dart';
import 'package:style_sphere/features/cart/domain/repositories/cart_repository.dart';

class PlaceOrderUsecase {
  final CartRepository cartRepository;

  PlaceOrderUsecase({required this.cartRepository});
  Future<Either<Failure, Unit>> call(OrderEntity order) => cartRepository.placeOrder(order);
}
