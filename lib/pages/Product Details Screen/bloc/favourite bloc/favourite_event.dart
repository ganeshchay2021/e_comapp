// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favourite_bloc.dart';

sealed class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class FavouriteLikeEvent extends FavouriteEvent {
  final ProductModel product;
  const FavouriteLikeEvent({
    required this.product,
  });
  @override
  List<Object> get props => [product];
}
