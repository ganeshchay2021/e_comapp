part of 'favourite_bloc.dart';

sealed class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

final class FavouriteInitialState extends FavouriteState {}

final class FavouriteLikeState extends FavouriteState {
  final List<ProductModel> product;

  const FavouriteLikeState({required this.product});
  
  @override
  List<Object> get props => [product];
}


