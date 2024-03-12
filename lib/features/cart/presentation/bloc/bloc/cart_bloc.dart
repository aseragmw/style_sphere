import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:style_sphere/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:style_sphere/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:style_sphere/features/cart/domain/usecases/add_item_to_cart_usecase.dart';
import 'package:style_sphere/features/cart/domain/usecases/get_all_cart_items_usecase.dart';
import 'package:style_sphere/features/cart/domain/usecases/remove_item_to_favourites_usecase.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AddItemToCartEvent>(
      (event, emit) async {
        emit(AddItemToCartLoadingState());
        AddItemToCartUsecase addItemToCartUsecase = AddItemToCartUsecase(
            cartRepository: CartRepositoryImpl(cartRemoteDataSource: CartRemoteDataSourceImplWithFirestore()));
        final either = await addItemToCartUsecase.call(event.itemID);
        either.fold((l) {
          emit(AddItemToCartErrorState(message: l.message));
        }, (r) => emit(AddItemToCartSuccessState()));
      },
    );

    on<RemoveItemFromCartEvent>(
      (event, emit) async {
        emit(RemoveItemFromCartLoadingState());
        RemoveItemFromCartUsecase removeItemFromCartUsecase = RemoveItemFromCartUsecase(
            cartRepository: CartRepositoryImpl(cartRemoteDataSource: CartRemoteDataSourceImplWithFirestore()));
        final either = await removeItemFromCartUsecase.call(event.itemID);
        either.fold((l) {
          emit(RemoveItemFromCartErrorState(message: l.message));
        }, (r) => emit(RemoveItemFromCartSuccessState()));
      },
    );

    on<GetAllCartItemsEvent>(
      (event, emit) async {
        emit(GetAllCartItemsLoadingState());
        GetAllCartItemsUsecase getAllCartItemsUsecase = GetAllCartItemsUsecase(
            cartRepository: CartRepositoryImpl(cartRemoteDataSource: CartRemoteDataSourceImplWithFirestore()));
        final either = await getAllCartItemsUsecase.call();
        either.fold((l) {
          emit(GetAllCartItemsErrorState(message: l.message));
        }, (r) => emit(GetAllCartItemsSuccessState()));
      },
    );
  }
}
