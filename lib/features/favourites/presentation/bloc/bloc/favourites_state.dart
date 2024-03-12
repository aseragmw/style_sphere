part of 'favourites_bloc.dart';

sealed class FavouritesState extends Equatable {
  const FavouritesState();

  @override
  List<Object> get props => [];
}

final class FavouritesInitial extends FavouritesState {}

class AddItemToFavouritesLoadingState extends FavouritesState {}

class AddItemToFavouritesErrorState extends FavouritesState {
  final String message;

  const AddItemToFavouritesErrorState({required this.message});
}

class AddItemToFavouritesSuccessState extends FavouritesState {}

class RemoveItemFromFavouritesLoadingState extends FavouritesState {}

class RemoveItemFromFavouritesErrorState extends FavouritesState {
  final String message;

  const RemoveItemFromFavouritesErrorState({required this.message});
}

class RemoveItemFromFavouritesSuccessState extends FavouritesState {

}

class GetAllFavouritesLoadingState extends FavouritesState {}

class GetAllFavouritesErrorState extends FavouritesState {
  final String message;

  const GetAllFavouritesErrorState({required this.message});
}

class GetAllFavouritesSuccessState extends FavouritesState {

}