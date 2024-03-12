part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

class AddItemToCartLoadingState extends CartState {}

class AddItemToCartErrorState extends CartState {
  final String message;

  const AddItemToCartErrorState({required this.message});
}

class AddItemToCartSuccessState extends CartState {}

class RemoveItemFromCartLoadingState extends CartState {}

class RemoveItemFromCartErrorState extends CartState {
  final String message;

  const RemoveItemFromCartErrorState({required this.message});
}

class RemoveItemFromCartSuccessState extends CartState {}

class GetAllCartItemsLoadingState extends CartState {}

class GetAllCartItemsErrorState extends CartState {
  final String message;

  const GetAllCartItemsErrorState({required this.message});
}

class GetAllCartItemsSuccessState extends CartState {}
