import 'package:dartz/dartz.dart';
import 'package:style_sphere/core/errors/failures.dart';
import 'package:style_sphere/core/shared_models/product/product_model.dart';
import 'package:style_sphere/features/favourites/data/datasources/favourites_remote_data_source.dart';
import 'package:style_sphere/features/favourites/domain/repositories/favourites_repository.dart';

class FavouritesRepositoryImpl extends FavouritesRepository {
  final FavouritesRemoteDataSource favouritesRemoteDataSource;

  FavouritesRepositoryImpl({required this.favouritesRemoteDataSource});
  @override
  Future<Either<Failure, Unit>> addItemToFavourites(String itemID) async{
    try {
      await favouritesRemoteDataSource.addItemToFavourites(itemID);
      return const Right(unit);
    } catch (e) {
      return const Left(Failure(message: 'Adding item Failed, Try again later'));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeItemFromFavourites(String itemID)async {
     try {
      await favouritesRemoteDataSource.removeItemFromFavourites(itemID);
      return const Right(unit);
    } catch (e) {
      return const Left(Failure(message: 'Removing item Failed, Try again later'));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getAllFavouritesItems() async{
    try {
      final items = await favouritesRemoteDataSource.getAllFavouritesItems();
      return  Right(items);
    } catch (e) {
      return const Left(Failure(message: 'Getting products Failed, Try again later'));
    }
  }
}
