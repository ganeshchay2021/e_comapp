import 'package:e_comapp/constant/constant.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/ui/product_details.dart';
import 'package:flutter/material.dart';

class ProductMoreInfo extends StatelessWidget {
  const ProductMoreInfo({
    super.key,
    required this.widget,
    required TabController controller,
  }) : _controller = controller;

  final ProductDetailsScreen widget;
  final TabController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(
            20,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$${widget.product.price}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          color: kprimaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.white,
                            ),
                            Text(
                              "${widget.product.rate}",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.product.review,
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  children: [
                    const TextSpan(text: "Seller: "),
                    TextSpan(
                      text: widget.product.seller,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Color",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              widget.product.colors.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: index == 0 ? Colors.black : Colors.white,
                            width: 2)),
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: widget.product.colors[index],
                          shape: BoxShape.circle),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 45,
            child: TabBar(
              unselectedLabelStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              physics: const BouncingScrollPhysics(),
              labelPadding: const EdgeInsets.symmetric(horizontal: 10),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: kprimaryColor),
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              controller: _controller,
              tabs: const [
                Text("Description"),
                Text("Specifications"),
                Text("Reviews"),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 150,
            child: TabBarView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Text(
                  widget.product.description,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  widget.product.description,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  widget.product.description,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
