import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:style_sphere/core/shared_models/product/product_model.dart';

abstract class FavouritesRemoteDataSource {
  Future<Unit> addItemToFavourites(String itemID);
  Future<Unit> removeItemFromFavourites(String itemID);
  Future<List<ProductModel>> getAllFavouritesItems();
}

class FavouritesRemoteDataSourceImplWithFirestore extends FavouritesRemoteDataSource {
  static final firestore = FirebaseFirestore.instance;

  @override
  Future<Unit> addItemToFavourites(String itemID) {
    // TODO: implement addItemToFavourites
    throw UnimplementedError();
  }

  @override
  Future<Unit> removeItemFromFavourites(String itemID) {
    // TODO: implement removeItemFromFavourites
    throw UnimplementedError();
  }
  
  @override
  Future<List<ProductModel>> getAllFavouritesItems() {
    // TODO: implement getAllFavouritesItems
    throw UnimplementedError();
  }
}
