import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/features/favourites/domain/repositories/favourites_repository.dart';

class RemoveItemFromFavouritesUsecase {
  final FavouritesRepository favouritesRepository;

  RemoveItemFromFavouritesUsecase({required this.favouritesRepository});
  Future<Either<Failure, Unit>> call(String itemID) => favouritesRepository.removeItemFromFavourites(itemID);
}
