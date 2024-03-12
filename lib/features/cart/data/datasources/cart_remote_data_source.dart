import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:style_sphere/features/cart/data/models/cart_item_model.dart';

abstract class CartRemoteDataSource {
  Future<Unit> addItemToCart(String itemID);
  Future<Unit> removeItemFromCart(String itemID);
  Future<List<CartItemModel>> getAllCartItems();
}

class CartRemoteDataSourceImplWithFirestore extends CartRemoteDataSource {
  static final firestore = FirebaseFirestore.instance;
  
  @override
  Future<Unit> addItemToCart(String itemID) {
    // TODO: implement addItemToCart
    throw UnimplementedError();
  }
  
  @override
  Future<List<CartItemModel>> getAllCartItems() {
    // TODO: implement getAllCartItems
    throw UnimplementedError();
  }
  
  @override
  Future<Unit> removeItemFromCart(String itemID) {
    // TODO: implement removeItemFromCart
    throw UnimplementedError();
  }

  
}
