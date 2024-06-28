import 'package:e_comapp/Model/product_model.dart';

class CartRepository {
  final List<ProductModel> _cart = [];
  List<ProductModel> get cart => _cart;
  void addToCart(ProductModel product) {
    if (_cart.contains(product)) {
      for (ProductModel element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
      // print(cart.length);
    }
  }

  void deleteProduct(ProductModel product) {
    if (_cart.contains(product)) {
      _cart.remove(product);
    } else {
      return;
    }
  }

  incrementQtn(int index) {
    _cart[index].quantity++;
  }

  // for decrement
  decrementQtn(int index) {
    if (_cart[index].quantity <= 1) {
      return;
    }
    _cart[index].quantity--;
  }

   double totalPrice() {
    double myTotal = 0.0; // initial
    for (ProductModel element in _cart) {
      myTotal += element.price * element.quantity;
    }
    return myTotal;
  }
}
