// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_comapp/pages/Product%20Details%20Screen/widget/add_to_cart.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/widget/product_more_info.dart';
import 'package:flutter/material.dart';
import 'package:e_comapp/Model/product_model.dart';
import 'package:e_comapp/constant/constant.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/widget/details_page_appbar.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/widget/product_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller = TabController(length: 3, vsync: this);
  int currentSlider = 0;
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: true,
      floatingActionButton: AddToCart(
        product: widget.product,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            DetailsPageAppbar(
              productModel: widget.product,
            ),
            ProductSlider(
              currentSlider: currentSlider,
              onChanged: (value) {
                setState(
                  () {
                    currentSlider = value;
                  },
                );
              },
              product: widget.product,
            ),
            const SizedBox(
              height: 15,
            ),
            ProductMoreInfo(widget: widget, controller: _controller)
          ],
        ),
      ),
    );
  }
}
