import 'package:e_comapp/Model/product_model.dart';

class FavouriteRepository {
  final List<ProductModel> _favorite = [];
  List<ProductModel> get favorite => _favorite;

  void toggleFavorite(ProductModel product) {
    if (_favorite.contains(product)) {
      _favorite.remove(product);
    } else {
      _favorite.add(product);
      print(favorite.length);
    }
  }
}
