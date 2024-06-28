import 'package:e_comapp/Model/product_model.dart';
import 'package:equatable/equatable.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class ProductCartInitialState extends CartState {}

final class ProductAddedState extends CartState {
  final List<ProductModel> product;

  const ProductAddedState({required this.product});

  @override
  List<Object> get props => [identityHashCode(this), product];
}

final class ProductErrorState extends CartState {
  final String errorMsg;

  const ProductErrorState({required this.errorMsg});
}

final class TotalPriceState extends CartState {
  final double totalPrice;

  const TotalPriceState({required this.totalPrice});
}
