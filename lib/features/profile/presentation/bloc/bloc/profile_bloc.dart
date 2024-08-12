import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:style_sphere/core/shared_models/order/order_enitity.dart';
import 'package:style_sphere/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:style_sphere/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:style_sphere/features/profile/domain/entities/shipping_address_enitiy.dart';
import 'package:style_sphere/features/profile/domain/usecases/add_shipping_address_usecase.dart';
import 'package:style_sphere/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:style_sphere/features/profile/domain/usecases/edit_shipping_address_usecase.dart';
import 'package:style_sphere/features/profile/domain/usecases/get_orders_usecase.dart';
import 'package:style_sphere/features/profile/domain/usecases/remove_shipping_address_usecase.dart';
import 'package:style_sphere/features/profile/domain/usecases/update_personal_info_usecase.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AddShippingAddressEvent>(
      (event, emit) async {
        emit(AddShippingAddressLoadingState());
        AddShippingAddressUsecase addShippingAddressUsecase = AddShippingAddressUsecase(
            profileRepository: ProfileRepositoryImpl(profileRemoteDataSource: ProfileRemoteDataSourceImplWithFirestore()));
        final either = await addShippingAddressUsecase.call(event.address);
        either.fold((l) {
          emit(AddShippingAddressErrorState(message: l.message));
        }, (r) => emit(AddShippingAddressSuccessState()));
      },
    );

    on<EditShippingAddressEvent>(
      (event, emit) async {
        emit(EditShippingAddressLoadingState());
        EditShippingAddressUsecase editShippingAddressUsecase = EditShippingAddressUsecase(
            profileRepository: ProfileRepositoryImpl(profileRemoteDataSource: ProfileRemoteDataSourceImplWithFirestore()));
        final either = await editShippingAddressUsecase.call(event.address);
        either.fold((l) {
          emit(EditShippingAddressErrorState(message: l.message));
        }, (r) => emit(EditShippingAddressSuccessState()));
      },
    );

    on<RemoveShippingAddreessEvent>(
      (event, emit) async {
        emit(RemoveShippingAddressLoadingState());
        RemoveShippingAddressUsecase removeShippingAddressUsecase = RemoveShippingAddressUsecase(
            profileRepository: ProfileRepositoryImpl(profileRemoteDataSource: ProfileRemoteDataSourceImplWithFirestore()));
        final either = await removeShippingAddressUsecase.call(event.address);
        either.fold((l) {
          emit(RemoveShippingAddressErrorState(message: l.message));
        }, (r) => emit(RemoveShippingAddressSuccessState()));
      },
    );

    on<ChangePasswordEvent>(
      (event, emit) async {
        emit(ChangePasswordLoadingState());
        ChangePasswordUsecase changePasswordUsecase = ChangePasswordUsecase(
            profileRepository: ProfileRepositoryImpl(profileRemoteDataSource: ProfileRemoteDataSourceImplWithFirestore()));
        final either = await changePasswordUsecase.call(event.password);
        either.fold((l) {
          emit(ChangePasswordErrorState(message: l.message));
        }, (r) => emit(ChangePasswordSuccessState()));
      },
    );

    on<UpdatePersonalInfoEvent>(
      (event, emit) async {
        emit(UpdatePersonalInfoLoadingState());
        UpdatePersonalInfoUsecase updatePersonalInfoUsecase = UpdatePersonalInfoUsecase(
            profileRepository: ProfileRepositoryImpl(profileRemoteDataSource: ProfileRemoteDataSourceImplWithFirestore()));
        final either = await updatePersonalInfoUsecase.call(event.key,event.value);
        either.fold((l) {
          emit(UpdatePersonalInfoErrorState(message: l.message));
        }, (r) => emit(UpdatePersonalInfoSuccessState()));
      },
    );

    on<GetOrdersEvent>(
      (event, emit) async {
        emit(GetOrdersLoadingState());
        GetOrdersUsecase getOrdersUsecase = GetOrdersUsecase(
            profileRepository: ProfileRepositoryImpl(profileRemoteDataSource: ProfileRemoteDataSourceImplWithFirestore()));
        final either = await getOrdersUsecase.call(event.key);
        either.fold((l) {
          emit(GetOrdersErrorState(message: l.message));
        }, (r) => emit(GetOrdersSuccessState(orders: r)));
      },
    );
  }
}
