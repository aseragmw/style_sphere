part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object> get props => [];
}

class AddShippingAddressEvent extends ProfileEvent {
  final ShippingAddressEntity address;
  const AddShippingAddressEvent({required this.address});
}

class RemoveShippingAddreessEvent extends ProfileEvent {
  final ShippingAddressEntity address;
  const RemoveShippingAddreessEvent({required this.address});
}

class EditShippingAddressEvent extends ProfileEvent {
    final ShippingAddressEntity address;

  const EditShippingAddressEvent({required this.address});

}

class ChangePasswordEvent extends ProfileEvent {
    final String password;

  const ChangePasswordEvent({required this.password});

}
class UpdatePersonalInfoEvent extends ProfileEvent {
final String key;
final String value;

  const UpdatePersonalInfoEvent({required this.key, required this.value});

}
class GetOrdersEvent extends ProfileEvent {
final String key;
  const GetOrdersEvent({required this.key});

}
