// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:e_comapp/Model/product_model.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}
class FetchCartProductEvent extends CartEvent{}
class ProductAddToCartEvent extends CartEvent {
  final ProductModel product;
  const ProductAddToCartEvent({
    required this.product,
  });
  @override
  List<Object> get props => [product];
}

class ProductRemoveEvent extends CartEvent {
  final ProductModel product;
  const ProductRemoveEvent({
    required this.product,
  });
}

class ProductIncreaseEvent extends CartEvent {
  final int index;
  const ProductIncreaseEvent({
    required this.index,
  });
}

class ProductDecreaseEvent extends CartEvent {
  final int index;
  const ProductDecreaseEvent({
    required this.index,
  });
}

class TotalPriceEvent extends CartEvent {}
