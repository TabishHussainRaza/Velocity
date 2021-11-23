import 'dart:async';
import 'dart:convert';

import 'package:ecommerece_velocity_app/components/coustom_bottom_nav_bar.dart';
import 'package:ecommerece_velocity_app/screens/category/detailspage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../enums.dart';
import '../../size_config.dart';

Future<All_categories> fetchAlbum() async {
  String url = serverUrl + "categories";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return All_categories.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

All_categories categoryFromJson(String str) =>
    All_categories.fromJson(json.decode(str));

String categoryToJson(All_categories dataCategory) =>
    json.encode(dataCategory.toJson());

class All_categories {
  All_categories({
    required this.dataCategory,
    required this.links,
    required this.meta,
  });

  final List<Datum> dataCategory;
  final Links links;
  final Meta meta;

  factory All_categories.fromJson(Map<String, dynamic> json) => All_categories(
        dataCategory:
            List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(dataCategory.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.code,
    required this.name,
    required this.slug,
    required this.displayMode,
    required this.description,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeywords,
    required this.status,
    required this.imageUrl,
    required this.categoryIconPath,
    required this.additional,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final dynamic code;
  final String name;
  final String slug;
  final String displayMode;
  String description;
  final String metaTitle;
  final String metaDescription;
  final String metaKeywords;
  final int status;
  final String imageUrl;
  final dynamic categoryIconPath;
  final dynamic additional;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        slug: json["slug"],
        displayMode: json["display_mode"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
        status: json["status"],
        imageUrl: json["image_url"],
        categoryIconPath: json["category_icon_path"],
        additional: json["additional"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "slug": slug,
        "display_mode": displayMode,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
        "status": status,
        "image_url": imageUrl,
        "category_icon_path": categoryIconPath,
        "additional": additional,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  final String first;
  final String last;
  final dynamic prev;
  final dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  final int currentPage;
  final int from;
  final int lastPage;
  final List<Link> links;
  final String path;
  final int perPage;
  final int to;
  final int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  final dynamic url;
  final dynamic label;
  final bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class CategorySection extends StatefulWidget {
  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  // List<Category> categories = Utils.getMockedCategories();
  late Future<All_categories> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: Drawer(),
        appBar: buildAppBar(context),
        body: FutureBuilder<All_categories>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.dataCategory.length,
                  itemBuilder: (_, index) {
                    snapshot.data!.dataCategory[index].description = removeAllHtmlTags(snapshot.data!.dataCategory[index].description);
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
                                  tileMode: TileMode.clamp)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                          Padding(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(25),
                          ),),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Text(
                                  //   '${snapshot.data!.dataCategory[index].imageUrl}',
                                  //   style: TextStyle(
                                  //       fontSize: 20.0,
                                  //       color: Colors.white70,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  Text(
                                    '${snapshot.data!.dataCategory[index].name}',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    '${snapshot.data!.dataCategory[index].description}',
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.white70),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          // Text(
                                          //     '${snapshot.data!.dataCategory[index].metaKeywords}',
                                          //     style: TextStyle(
                                          //         fontSize: 12.0,
                                          //         color: Colors.white)),
                                          // Text(
                                          //     '${snapshot.data!.dataCategory[index].metaTitle}',
                                          //     style: TextStyle(
                                          //         fontSize: 10.0,
                                          //         color: Colors.white)),
                                        ],
                                        // ),
                                        // Column(
                                        //   children: <Widget>[
                                        //     Text('2342',
                                        //         style: TextStyle(
                                        //             fontSize: 12.0,
                                        //             color: Colors.white)),
                                        //     Text('Like',
                                        //         style: TextStyle(
                                        //             fontSize: 10.0,
                                        //             color: Colors.white)),
                                        //   ],
                                        // ),
                                        // Column(
                                        //   children: <Widget>[
                                        //     Text('2342',
                                        //         style: TextStyle(
                                        //             fontSize: 12.0,
                                        //             color: Colors.white)),
                                        //     Text('Followed',
                                        //         style: TextStyle(
                                        //             fontSize: 10.0,
                                        //             color: Colors.white)),
                                        // ],
                                      )
                                    ],
                                  )
                                ],
                              )),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '→',
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.white70),
                                      ),
                                      Text(
                                        'Products',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      snapshot.data!.dataCategory[index])));
                        });
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        bottomNavigationBar:
            const CustomBottomNavBar(selectedMenu: MenuState.Category));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: const [
          Text(
            "Categories",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }
}
