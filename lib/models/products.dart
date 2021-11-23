import 'dart:convert';

ProductList productListFromJson(String str) => ProductList.fromJson(json.decode(str));

String productToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  ProductList({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<Product> data;
  Links links;
  Meta meta;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class Product {

  Product({
    required this.id,
    required this.sku,
    required this.type,
    required this.name,
    required this.urlKey,
    required this.price,
    required this.formatedPrice,
    required this.shortDescription,
    required this.description,
    required this.images,
    required this.videos,
    required this.baseImage,
    required this.createdAt,
    required this.updatedAt,
    //required this.relatedProducts,
    required this.inStock,
    required this.totalQuantity,
    required this.isSaved,
    required this.isWishlisted,
    required this.isItemInCart,
    required this.showQuantityChanger,
  });

  int id;
  String sku;
  String type;
  String name;
  String urlKey;
  String price;
  String formatedPrice;
  String shortDescription;
  String description;
  List<image> images;
  List<dynamic> videos;
  BaseImage baseImage;
  DateTime createdAt;
  DateTime updatedAt;
  //List<RelatedProduct> relatedProducts;
  bool inStock;
  int totalQuantity;
  bool isSaved;
  bool isWishlisted;
  bool isItemInCart;
  bool showQuantityChanger;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    sku: json["sku"],
    type: json["type"],
    name: json["name"],
    urlKey: json["url_key"],
    price: json["price"],
    formatedPrice: json["formated_price"],
    shortDescription: json["short_description"],
    description: json["description"],
    images: List<image>.from(json["images"].map((x) => image.fromJson(x))),
    videos: List<dynamic>.from(json["videos"].map((x) => x)),
    baseImage: BaseImage.fromJson(json["base_image"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    //relatedProducts: List<RelatedProduct>.from(json["related-products"].map((x) => RelatedProduct.fromJson(x))),
    inStock: json["in_stock"],
    totalQuantity: json["total_quantity"],
    isSaved: json["is_saved"],
    isWishlisted: json["is_wishlisted"],
    isItemInCart: json["is_item_in_cart"],
    showQuantityChanger: json["show_quantity_changer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "type": type,
    "name": name,
    "url_key": urlKey,
    "price": price,
    "formated_price": formatedPrice,
    "short_description": shortDescription,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "videos": List<dynamic>.from(videos.map((x) => x)),
    "base_image": baseImage.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    //"related-products": List<dynamic>.from(relatedProducts.map((x) => x.toJson())),
    "in_stock": inStock,
    "total_quantity": totalQuantity,
    "is_saved": isSaved,
    "is_wishlisted": isWishlisted,
    "is_item_in_cart": isItemInCart,
    "show_quantity_changer": showQuantityChanger,
  };
}

class BaseImage {
  BaseImage({
    required this.smallImageUrl,
    required this.mediumImageUrl,
    required this.largeImageUrl,
    required this.originalImageUrl,
  });

  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;
  String originalImageUrl;

  factory BaseImage.fromJson(Map<String, dynamic> json) => BaseImage(
    smallImageUrl: json["small_image_url"],
    mediumImageUrl: json["medium_image_url"],
    largeImageUrl: json["large_image_url"],
    originalImageUrl: json["original_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "small_image_url": smallImageUrl,
    "medium_image_url": mediumImageUrl,
    "large_image_url": largeImageUrl,
    "original_image_url": originalImageUrl,
  };
}

class image {
  image({
    required this.id,
    required this.path,
    required this.url,
    required this.originalImageUrl,
    required this.smallImageUrl,
    required this.mediumImageUrl,
    required this.largeImageUrl,
  });

  int id;
  String path;
  String url;
  String originalImageUrl;
  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;

  factory image.fromJson(Map<String, dynamic> json) => image(
    id: json["id"],
    path: json["path"],
    url: json["url"],
    originalImageUrl: json["original_image_url"],
    smallImageUrl: json["small_image_url"],
    mediumImageUrl: json["medium_image_url"],
    largeImageUrl: json["large_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "path": path,
    "url": url,
    "original_image_url": originalImageUrl,
    "small_image_url": smallImageUrl,
    "medium_image_url": mediumImageUrl,
    "large_image_url": largeImageUrl,
  };
}

class RelatedProduct {
  RelatedProduct({
    required this.id,
    required this.sku,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.parentId,
    required this.attributeFamilyId,
    required this.additional,
    required this.shortDescription,
    required this.description,
    required this.name,
    required this.urlKey,
    required this.taxCategoryId,
    required this.relatedProductNew,
    required this.featured,
    required this.visibleIndividually,
    required this.status,
    required this.color,
    required this.size,
    required this.brand,
    required this.guestCheckout,
    required this.productNumber,
    required this.metaTitle,
    required this.metaKeywords,
    required this.metaDescription,
    required this.price,
    required this.cost,
    required this.specialPrice,
    required this.specialPriceFrom,
    required this.specialPriceTo,
    required this.length,
    required this.width,
    required this.height,
    required this.weight,
    required this.pivot,
    required this.attributeFamily,
  });

  int id;
  String sku;
  String type;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic parentId;
  int attributeFamilyId;
  dynamic additional;
  String shortDescription;
  String description;
  String name;
  String urlKey;
  int taxCategoryId;
  int relatedProductNew;
  int featured;
  int visibleIndividually;
  int status;
  int color;
  int size;
  dynamic brand;
  int guestCheckout;
  String productNumber;
  String metaTitle;
  String metaKeywords;
  String metaDescription;
  String price;
  dynamic cost;
  dynamic specialPrice;
  dynamic specialPriceFrom;
  dynamic specialPriceTo;
  String length;
  String width;
  String height;
  String weight;
  Pivot pivot;
  AttributeFamily attributeFamily;

  factory RelatedProduct.fromJson(Map<String, dynamic> json) => RelatedProduct(
    id: json["id"],
    sku: json["sku"],
    type: json["type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    parentId: json["parent_id"],
    attributeFamilyId: json["attribute_family_id"],
    additional: json["additional"],
    shortDescription: json["short_description"],
    description: json["description"],
    name: json["name"],
    urlKey: json["url_key"],
    taxCategoryId: json["tax_category_id"],
    relatedProductNew: json["new"],
    featured: json["featured"],
    visibleIndividually: json["visible_individually"],
    status: json["status"],
    color: json["color"],
    size: json["size"],
    brand: json["brand"],
    guestCheckout: json["guest_checkout"],
    productNumber: json["product_number"],
    metaTitle: json["meta_title"],
    metaKeywords: json["meta_keywords"],
    metaDescription: json["meta_description"],
    price: json["price"],
    cost: json["cost"],
    specialPrice: json["special_price"],
    specialPriceFrom: json["special_price_from"],
    specialPriceTo: json["special_price_to"],
    length: json["length"],
    width: json["width"],
    height: json["height"],
    weight: json["weight"],
    pivot: Pivot.fromJson(json["pivot"]),
    attributeFamily: AttributeFamily.fromJson(json["attribute_family"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "type": type,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "parent_id": parentId,
    "attribute_family_id": attributeFamilyId,
    "additional": additional,
    "short_description": shortDescription,
    "description": description,
    "name": name,
    "url_key": urlKey,
    "tax_category_id": taxCategoryId,
    "new": relatedProductNew,
    "featured": featured,
    "visible_individually": visibleIndividually,
    "status": status,
    "color": color,
    "size": size,
    "brand": brand,
    "guest_checkout": guestCheckout,
    "product_number": productNumber,
    "meta_title": metaTitle,
    "meta_keywords": metaKeywords,
    "meta_description": metaDescription,
    "price": price,
    "cost": cost,
    "special_price": specialPrice,
    "special_price_from": specialPriceFrom,
    "special_price_to": specialPriceTo,
    "length": length,
    "width": width,
    "height": height,
    "weight": weight,
    "pivot": pivot.toJson(),
    "attribute_family": attributeFamily.toJson(),
  };
}

class AttributeFamily {
  AttributeFamily({
    required this.id,
    required this.code,
    required this.name,
    required this.status,
    required this.isUserDefined,
  });

  int id;
  String code;
  String name;
  int status;
  int isUserDefined;

  factory AttributeFamily.fromJson(Map<String, dynamic> json) => AttributeFamily(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    status: json["status"],
    isUserDefined: json["is_user_defined"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "status": status,
    "is_user_defined": isUserDefined,
  };
}

class Pivot {
  Pivot({
    required this.parentId,
    required this.childId,
  });

  int parentId;
  int childId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    parentId: json["parent_id"],
    childId: json["child_id"],
  );

  Map<String, dynamic> toJson() => {
    "parent_id": parentId,
    "child_id": childId,
  };
}

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  String first;
  String last;
  dynamic prev;
  dynamic next;

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

  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

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

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "label": label,
    "active": active,
  };
}

List<Product> demoProducts = [
  Product
    (
      id: 1,
      sku: '14121412',
      type: 'simple',
      name: 'Bakehouse Garlic Bread 300g',
      urlKey: 'Gluten Free Bakehouse Garlic Bread 300g',
      price: '3.80',
      shortDescription: 'Gluten Free Bakehouse Garlic Bread is both gluten free and vegan friendly. Our crusty, golden garlic bread has no artificial flavours or colours, just good honest ingredients.',
      description: 'Gluten Free Bakehouse Garlic Bread is both gluten free and vegan friendly. Our crusty, golden garlic bread has no artificial flavours or colours, just good honest ingredients.',
      images: [
        image(
            id: 1,
            path: "product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            url: "http://localhost/storage/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            originalImageUrl: "http://localhost/storage/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            smallImageUrl: "assets/images/gf_gp.png",
            mediumImageUrl: "assets/images/gf_gp.png",
            largeImageUrl: "http://192.168.8.193:8090/cache/large/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png"

        )
      ],
      videos: [],
      baseImage: BaseImage(
          smallImageUrl: "http://192.168.8.193:8090/cache/small/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
          mediumImageUrl: "http://192.168.8.193:8090/cache/medium/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
          largeImageUrl: "http://192.168.8.193:8090/cache/large/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
          originalImageUrl: "http://192.168.8.193:8090/cache/original/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png"
      ),
      createdAt: DateTime.parse("2021-08-29T01:34:43.000000Z"),
      updatedAt: DateTime.parse("2021-08-29T01:34:43.000000Z"),
      //relatedProducts:[],
      totalQuantity:0,
      inStock: true,
      isSaved: false,
      isWishlisted: false,
      isItemInCart: false,
      showQuantityChanger: true,
      formatedPrice: '10,000.00'),
  Product
    (
      id: 2,
      sku: '14121412',
      type: 'simple',
      name: 'Gluten Free Flour 750g',
      urlKey: 'Gluten Free Flour 750g',
      price: '2.65',
      shortDescription: 'Free From Plain Flour is all purpose plain flour for use in everyday cooking and baking contains gluten free, soy free, egg free, no artificial preservatives and no artificial colours or flavours.',
      description: 'Free From Plain Flour is all purpose plain flour for use in everyday cooking and baking contains gluten free, soy free, egg free, no artificial preservatives and no artificial colours or flavours.',
      images: [
        image(
            id: 2,
            path: "product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            url: "http://localhost/storage/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            originalImageUrl: "http://localhost/storage/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            smallImageUrl: "assets/images/flour.png",
            mediumImageUrl: "assets/images/flour.png",
            largeImageUrl: "http://192.168.8.193:8090/cache/large/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png"

        ),
        image(
            id: 2,
            path: "product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            url: "http://localhost/storage/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            originalImageUrl: "http://localhost/storage/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            smallImageUrl: "http://192.168.8.193:8090/cache/small/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            mediumImageUrl: "assets/images/flour_p2.png",
            largeImageUrl: "http://192.168.8.193:8090/cache/large/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png"

        )
      ],
      videos: [],
      //relatedProducts:[],
      totalQuantity:0,
      baseImage: BaseImage(
          smallImageUrl: "http://192.168.8.193:8090/cache/small/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
          mediumImageUrl: "http://192.168.8.193:8090/cache/medium/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
          largeImageUrl: "http://192.168.8.193:8090/cache/large/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
          originalImageUrl: "http://192.168.8.193:8090/cache/original/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png"
      ),
      createdAt: DateTime.parse("2021-08-29T01:34:43.000000Z"),
      updatedAt: DateTime.parse("2021-08-29T01:34:43.000000Z"),

      inStock: true,
      isSaved: false,
      isWishlisted: false,
      isItemInCart: false,
      showQuantityChanger: true,
      formatedPrice: '10,000.00')
];