import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ecommerece_velocity_app/models/Cart.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: CachedNetworkImage(
                imageUrl: cart.product.images[0].largeImageUrl,
                progressIndicatorBuilder:
                    (context, url, downloadProgress) => Center(
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: new CircularProgressIndicator(
                        value: downloadProgress.progress,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            kPrimaryColor),
                        semanticsLabel: 'Progress indicator',
                      ),
                    )),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error),
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black, fontSize: 13),
              maxLines: 1,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${cart.product.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${cart.numOfItem}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
