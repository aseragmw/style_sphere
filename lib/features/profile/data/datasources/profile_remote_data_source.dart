import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:style_sphere/core/shared_models/order/order_model.dart';
import 'package:style_sphere/features/profile/domain/entities/shipping_address_enitiy.dart';

abstract class ProfileRemoteDataSource {
  Future<Unit> addShippingAddress(ShippingAddressEntity address);
  Future<Unit> removeShippingAddress(ShippingAddressEntity address);
  Future<Unit> editShippingAddress(ShippingAddressEntity address);
  Future<Unit> changePassword(String password);
  Future<Unit> updatePresonalInfo(String key, String value);
  Future<List<OrderModel>> getOrders(String key);
}

class ProfileRemoteDataSourceImplWithFirestore extends ProfileRemoteDataSource {
  static final firestore = FirebaseFirestore.instance;

  @override
  Future<Unit> addShippingAddress(ShippingAddressEntity address) {
    // TODO: implement addShippingAddress
    throw UnimplementedError();
  }

  @override
  Future<Unit> editShippingAddress(ShippingAddressEntity address) {
    // TODO: implement editShippingAddress
    throw UnimplementedError();
  }

  @override
  Future<Unit> removeShippingAddress(ShippingAddressEntity address) {
    // TODO: implement removeShippingAddress
    throw UnimplementedError();
  }
  
  @override
  Future<Unit> changePassword(String password) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
  
  @override
  Future<List<OrderModel>> getOrders(String key) {
    // TODO: implement getOrders
    throw UnimplementedError();
  }
  
  @override
  Future<Unit> updatePresonalInfo(String key, String value) {
    // TODO: implement updatePresonalInfo
    throw UnimplementedError();
  }
}
