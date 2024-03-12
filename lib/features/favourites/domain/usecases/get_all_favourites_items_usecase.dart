import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/core/shared_models/product/product_entity.dart';
import 'package:style_sphere/features/favourites/domain/repositories/favourites_repository.dart';

class GetAllFavouritesItemsUsecase {
  final FavouritesRepository favouritesRepository;

  GetAllFavouritesItemsUsecase({required this.favouritesRepository});
    Future<Either<Failure, List<ProductEntity>>> call() => favouritesRepository.getAllFavouritesItems();
}
