part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object> get props => [];
}

class AddItemToCartEvent extends CartEvent {
  final String itemID;
  const AddItemToCartEvent({required this.itemID});
}

class RemoveItemFromCartEvent extends CartEvent {
  final String itemID;
  const RemoveItemFromCartEvent({required this.itemID});
}

class GetAllCartItemsEvent extends CartEvent {}
