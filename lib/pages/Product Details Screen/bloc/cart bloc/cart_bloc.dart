import 'package:bloc/bloc.dart';
import 'package:e_comapp/Repository/cart_repository.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/bloc/cart%20bloc/cart_event.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/bloc/cart%20bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({required this.cartRepository}) : super(ProductCartInitialState()) {
    on<ProductAddToCartEvent>((event, emit) {
      cartRepository.addToCart(event.product);
      emit(ProductAddedState(product: List.from(cartRepository.cart)));
    });

    on<ProductRemoveEvent>((event, emit) {
      cartRepository.deleteProduct(event.product);
      emit(ProductAddedState(product: List.from(cartRepository.cart)));
    });

    on<ProductDecreaseEvent>((event, emit) {
      cartRepository.decrementQtn(event.index);
      emit(ProductAddedState(product: List.from(cartRepository.cart)));
    });

    on<ProductIncreaseEvent>((event, emit) {
      cartRepository.incrementQtn(event.index);
      emit(ProductAddedState(product: List.from(cartRepository.cart)));
    });

    on<TotalPriceEvent>((event, emit) {
      double totalPrice = cartRepository.totalPrice();
      emit(TotalPriceState(totalPrice: totalPrice));
    });

    on<FetchCartProductEvent>((event, emit) {
      emit(ProductAddedState(product: List.from(cartRepository.cart)));
    });
  }
}
