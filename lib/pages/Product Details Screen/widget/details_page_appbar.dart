// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_comapp/pages/Product%20Details%20Screen/bloc/favourite%20bloc/favourite_bloc.dart';
import 'package:flutter/material.dart';

import 'package:e_comapp/Model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPageAppbar extends StatefulWidget {
  final ProductModel productModel;
  const DetailsPageAppbar({
    super.key,
    required this.productModel,
  });

  @override
  State<DetailsPageAppbar> createState() => _DetailsPageAppbarState();
}

class _DetailsPageAppbarState extends State<DetailsPageAppbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          const Spacer(),
          IconButton(
            style: IconButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Colors.white),
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            style: IconButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Colors.white),
            onPressed: () {},
            icon: BlocBuilder<FavouriteBloc, FavouriteState>(
              builder: (context, state) {
                if (state is FavouriteLikeState) {
                  if (state.product.contains(widget.productModel)) {
                    return const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    );
                  } else {
                    return const Icon(Icons.favorite_border_outlined);
                  }
                } else {
                  return const Icon(Icons.favorite_border_outlined);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
