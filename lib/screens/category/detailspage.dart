import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerece_velocity_app/models/products.dart';
import 'package:ecommerece_velocity_app/screens/details/details_screen.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import 'category_list_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:async';


class DetailPage extends StatefulWidget {
  // final All_categories products;
  final Datum dataCategory;
  Random random = new Random();

  // DetailPage(this.products);
  DetailPage(this.dataCategory, {Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // late products_as_argument;
  late Future<ProductList> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchEachPost();
  }

  @override
  Widget build(BuildContext context) {
    // products_as_argument = ModalRoute.of(context)!.settings.arguments as All_categories;
    return Scaffold(
      appBar: buildAppBar(context),
      body: Center(
        child: FutureBuilder<ProductList>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.data.isEmpty) {
                return Center(
                    child: Text('No products under this category',
                        style: TextStyle(color: Colors.black)));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.data.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                          child: Container(
                            height: 150.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFF8B067),
                                      Color(0xFF00821E)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    tileMode: TileMode.repeated)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                            CachedNetworkImage(
                            imageUrl: snapshot.data!.data[index].images[0].mediumImageUrl,
                              imageBuilder: (context, imageProvider) => Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
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
                                Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          snapshot.data!.data[index].name,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        // ignore: prefer_const_constructors
                                        // Text(
                                        //   'Sunny',
                                        //   style: TextStyle(
                                        //       fontSize: 12.0,
                                        //       color: Colors.white70),
                                        // ),
                                        SizedBox(
                                          height: 10.0,
                                        ),

                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '→',
                                          style: TextStyle(
                                              fontSize: 30.0,
                                              color: Colors.white70),
                                        ),
                                        Text(
                                          'Item',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white70),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          onTap: () {

                            Product newProduct = snapshot.data?.data[index] as Product;
                            Navigator.pushNamed(
                                context,
                                DetailsScreen.routeName,
                                arguments: ProductDetailsArguments(product: newProduct));
                          });
                    });
              }
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }


  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: const [
          Text(
            "All Products",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Future<ProductList> fetchEachPost() async {
    var id = widget.dataCategory.id;
    print("here" + "${id}");
    // ignore: prefer_adjacent_string_concatenation
    String url = serverUrl +"products?category_id=" + "$id";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return productListFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}