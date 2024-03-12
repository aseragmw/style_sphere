part of 'favourites_bloc.dart';

sealed class FavouritesEvent extends Equatable {
  const FavouritesEvent();
  @override
  List<Object> get props => [];
}

class AddItemToFavouritesEvent extends FavouritesEvent {
  final String itemID;
  const AddItemToFavouritesEvent({required this.itemID});
}

class RemoveItemFromFavouritesEvent extends FavouritesEvent {
  final String itemID;
  const RemoveItemFromFavouritesEvent({required this.itemID});
}

class GetAllFavouritesItemsEvent extends FavouritesEvent {
  
}
