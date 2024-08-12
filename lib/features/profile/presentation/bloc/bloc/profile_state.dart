part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class AddShippingAddressLoadingState extends ProfileState {}

class AddShippingAddressErrorState extends ProfileState {
  final String message;

  const AddShippingAddressErrorState({required this.message});
}

class AddShippingAddressSuccessState extends ProfileState {}

class RemoveShippingAddressLoadingState extends ProfileState {}

class RemoveShippingAddressErrorState extends ProfileState {
  final String message;

  const RemoveShippingAddressErrorState({required this.message});
}

class RemoveShippingAddressSuccessState extends ProfileState {}

class EditShippingAddressLoadingState extends ProfileState {}

class EditShippingAddressErrorState extends ProfileState {
  final String message;

  const EditShippingAddressErrorState({required this.message});
}

class EditShippingAddressSuccessState extends ProfileState {}

class ChangePasswordLoadingState extends ProfileState {}

class ChangePasswordErrorState extends ProfileState {
  final String message;

  const ChangePasswordErrorState({required this.message});
}

class ChangePasswordSuccessState extends ProfileState {}

class UpdatePersonalInfoLoadingState extends ProfileState {}

class UpdatePersonalInfoErrorState extends ProfileState {
  final String message;

  const UpdatePersonalInfoErrorState({required this.message});
}

class UpdatePersonalInfoSuccessState extends ProfileState {}

class GetOrdersLoadingState extends ProfileState {}

class GetOrdersErrorState extends ProfileState {
  final String message;

  const GetOrdersErrorState({required this.message});
}

class GetOrdersSuccessState extends ProfileState {
  final List<OrderEntity> orders;

  const GetOrdersSuccessState({required this.orders});
}
