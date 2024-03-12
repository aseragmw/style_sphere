import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/core/shared_models/product/product_entity.dart';


abstract class FavouritesRepository {
  Future<Either<Failure, Unit>> addItemToFavourites(String itemID);
  Future<Either<Failure, Unit>> removeItemFromFavourites(String itemID);
  Future<Either<Failure, List<ProductEntity>>> getAllFavouritesItems();
}
