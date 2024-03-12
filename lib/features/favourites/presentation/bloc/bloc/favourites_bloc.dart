import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:style_sphere/features/favourites/data/datasources/favourites_remote_data_source.dart';
import 'package:style_sphere/features/favourites/data/repositories/favourites_repository_impl.dart';
import 'package:style_sphere/features/favourites/domain/usecases/add_item_to_favourites_usecase.dart';
import 'package:style_sphere/features/favourites/domain/usecases/get_all_favourites_items_usecase.dart';
import 'package:style_sphere/features/favourites/domain/usecases/remove_item_to_favourites_usecase.dart';
part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouriteBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouriteBloc() : super(FavouritesInitial()) {
    on<FavouritesEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AddItemToFavouritesEvent>(
      (event, emit) async {
        emit(AddItemToFavouritesLoadingState());
        AddItemToFavouritesUsecase addItemToFavouritesUsecase = AddItemToFavouritesUsecase(favouritesRepository: FavouritesRepositoryImpl(favouritesRemoteDataSource: FavouritesRemoteDataSourceImplWithFirestore()));
        final either = await addItemToFavouritesUsecase.call(event.itemID);
        either.fold((l) {
          
          emit(AddItemToFavouritesErrorState(message: l.message));
        }, (r) => emit(AddItemToFavouritesSuccessState()));
      },
    );

    on<RemoveItemFromFavouritesEvent>(
      (event, emit) async {
        emit(RemoveItemFromFavouritesLoadingState());
        RemoveItemFromFavouritesUsecase removeItemFromFavouritesUsecase = RemoveItemFromFavouritesUsecase(favouritesRepository: FavouritesRepositoryImpl(favouritesRemoteDataSource: FavouritesRemoteDataSourceImplWithFirestore()));
        final either = await removeItemFromFavouritesUsecase.call(event.itemID);
        either.fold((l) {
          
          emit(RemoveItemFromFavouritesErrorState(message: l.message));
        }, (r) => emit(RemoveItemFromFavouritesSuccessState()));
      },
    );

    on<GetAllFavouritesItemsEvent>(
      (event, emit) async {
        emit(GetAllFavouritesLoadingState());
        GetAllFavouritesItemsUsecase getAllFavouritesItemsUsecase = GetAllFavouritesItemsUsecase(favouritesRepository: FavouritesRepositoryImpl(favouritesRemoteDataSource: FavouritesRemoteDataSourceImplWithFirestore()));
        final either = await getAllFavouritesItemsUsecase.call();
        either.fold((l) {
          
          emit(GetAllFavouritesErrorState(message: l.message));
        }, (r) => emit(GetAllFavouritesSuccessState()));
      },
    );
  }
}
