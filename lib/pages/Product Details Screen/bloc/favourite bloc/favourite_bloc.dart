// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:e_comapp/Model/product_model.dart';
import 'package:e_comapp/Repository/favourite_repository.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavouriteRepository productRepository;
  FavouriteBloc({required this.productRepository})
      : super(FavouriteInitialState()) {
    on<FavouriteLikeEvent>((event, emit) {
      productRepository.toggleFavorite(event.product);
      emit(
        FavouriteLikeState(product: productRepository.favorite),
      );
    });
  }
}
