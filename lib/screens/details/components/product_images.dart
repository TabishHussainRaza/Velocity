import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerece_velocity_app/models/products.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenWidth(20)),
                SizedBox(
                  width: getProportionateScreenWidth(250),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Hero(
                        tag: widget.product.id.toString(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 0.5),
                          child: CachedNetworkImage(
                            imageUrl: widget
                                .product.images[selectedImage].largeImageUrl,
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
                        )),
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(20)),
              ],
            )),
        SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.images.length,
                (index) => buildSmallProductPreview(index)),
          ],
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(10),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: CachedNetworkImage(
          imageUrl: widget.product.images[index].largeImageUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        //Image.asset(widget.product.images[selectedImage].mediumImageUrl),
      ),
    );
  }
}
