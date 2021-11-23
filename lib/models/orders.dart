// To parse this JSON data, do
//
//     final ordersList = ordersListFromJson(jsonString);

import 'package:ecommerece_velocity_app/models/Customer.dart' as CustomerData;
import 'package:ecommerece_velocity_app/models/address.dart';
import 'package:ecommerece_velocity_app/models/products.dart';
import 'dart:convert';

OrdersList ordersListFromJson(String str) => OrdersList.fromJson(json.decode(str));

String ordersListToJson(OrdersList data) => json.encode(data.toJson());

class OrdersList {
  OrdersList({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<Order> data;
  Links links;
  Meta meta;

  factory OrdersList.fromJson(Map<String, dynamic> json) => OrdersList(
    data: List<Order>.from(json["data"].map((x) => Order.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class Order {
  Order({
    required this.id,
    required this.incrementId,
    required this.status,
    required this.statusLabel,
    required this.channelName,
    required this.isGuest,
    required this.customerEmail,
    required this.customerFirstName,
    required this.customerLastName,
    required this.shippingMethod,
    required this.shippingTitle,
    required this.paymentTitle,
    required this.shippingDescription,
    required this.couponCode,
    required this.isGift,
    required this.totalItemCount,
    required this.totalQtyOrdered,
    required this.baseCurrencyCode,
    required this.channelCurrencyCode,
    required this.orderCurrencyCode,
    required this.grandTotal,
    required this.formatedGrandTotal,
    required this.baseGrandTotal,
    required this.formatedBaseGrandTotal,
    required this.grandTotalInvoiced,
    required this.formatedGrandTotalInvoiced,
    required this.baseGrandTotalInvoiced,
    required this.formatedBaseGrandTotalInvoiced,
    required this.grandTotalRefunded,
    required this.formatedGrandTotalRefunded,
    required this.baseGrandTotalRefunded,
    required this.formatedBaseGrandTotalRefunded,
    required this.subTotal,
    required this.formatedSubTotal,
    required this.baseSubTotal,
    required this.formatedBaseSubTotal,
    required this.subTotalInvoiced,
    required this.formatedSubTotalInvoiced,
    required this.baseSubTotalInvoiced,
    required this.formatedBaseSubTotalInvoiced,
    required this.subTotalRefunded,
    required this.formatedSubTotalRefunded,
    required this.discountPercent,
    required this.discountAmount,
    required this.formatedDiscountAmount,
    required this.baseDiscountAmount,
    required this.formatedBaseDiscountAmount,
    required this.discountInvoiced,
    required this.formatedDiscountInvoiced,
    required this.baseDiscountInvoiced,
    required this.formatedBaseDiscountInvoiced,
    required this.discountRefunded,
    required this.formatedDiscountRefunded,
    required this.baseDiscountRefunded,
    required this.formatedBaseDiscountRefunded,
    required this.taxAmount,
    required this.formatedTaxAmount,
    required this.baseTaxAmount,
    required this.formatedBaseTaxAmount,
    required this.taxAmountInvoiced,
    required this.formatedTaxAmountInvoiced,
    required this.baseTaxAmountInvoiced,
    required this.formatedBaseTaxAmountInvoiced,
    required this.taxAmountRefunded,
    required this.formatedTaxAmountRefunded,
    required this.baseTaxAmountRefunded,
    required this.formatedBaseTaxAmountRefunded,
    required this.shippingAmount,
    required this.formatedShippingAmount,
    required this.baseShippingAmount,
    required this.formatedBaseShippingAmount,
    required this.shippingInvoiced,
    required this.formatedShippingInvoiced,
    required this.baseShippingInvoiced,
    required this.formatedBaseShippingInvoiced,
    required this.shippingRefunded,
    required this.formatedShippingRefunded,
    required this.baseShippingRefunded,
    required this.formatedBaseShippingRefunded,
    required this.customer,
    required this.channel,
    required this.shippingAddress,
    required this.billingAddress,
    required this.items,
    required this.invoices,
    required this.shipments,
    required this.updatedAt,
    required this.createdAt,
  });

  int id;
  String incrementId;
  String status;
  String statusLabel;
  String channelName;
  int isGuest;
  String customerEmail;
  String customerFirstName;
  String customerLastName;
  String shippingMethod;
  String shippingTitle;
  String paymentTitle;
  String shippingDescription;
  dynamic couponCode;
  int isGift;
  int totalItemCount;
  int totalQtyOrdered;
  String baseCurrencyCode;
  String channelCurrencyCode;
  String orderCurrencyCode;
  String grandTotal;
  String formatedGrandTotal;
  String baseGrandTotal;
  String formatedBaseGrandTotal;
  String grandTotalInvoiced;
  String formatedGrandTotalInvoiced;
  String baseGrandTotalInvoiced;
  String formatedBaseGrandTotalInvoiced;
  String grandTotalRefunded;
  String formatedGrandTotalRefunded;
  String baseGrandTotalRefunded;
  String formatedBaseGrandTotalRefunded;
  String subTotal;
  String formatedSubTotal;
  String baseSubTotal;
  String formatedBaseSubTotal;
  String subTotalInvoiced;
  String formatedSubTotalInvoiced;
  String baseSubTotalInvoiced;
  String formatedBaseSubTotalInvoiced;
  String subTotalRefunded;
  String formatedSubTotalRefunded;
  String discountPercent;
  String discountAmount;
  String formatedDiscountAmount;
  String baseDiscountAmount;
  String formatedBaseDiscountAmount;
  String discountInvoiced;
  String formatedDiscountInvoiced;
  String baseDiscountInvoiced;
  String formatedBaseDiscountInvoiced;
  String discountRefunded;
  String formatedDiscountRefunded;
  String baseDiscountRefunded;
  String formatedBaseDiscountRefunded;
  String taxAmount;
  String formatedTaxAmount;
  String baseTaxAmount;
  String formatedBaseTaxAmount;
  String taxAmountInvoiced;
  String formatedTaxAmountInvoiced;
  String baseTaxAmountInvoiced;
  String formatedBaseTaxAmountInvoiced;
  String taxAmountRefunded;
  String formatedTaxAmountRefunded;
  String baseTaxAmountRefunded;
  String formatedBaseTaxAmountRefunded;
  String shippingAmount;
  String formatedShippingAmount;
  String baseShippingAmount;
  String formatedBaseShippingAmount;
  String shippingInvoiced;
  String formatedShippingInvoiced;
  String baseShippingInvoiced;
  String formatedBaseShippingInvoiced;
  String shippingRefunded;
  String formatedShippingRefunded;
  String baseShippingRefunded;
  String formatedBaseShippingRefunded;
  CustomerData.Data customer;
  Channel channel;
  Address shippingAddress;
  Address billingAddress;
  List<DatumItem> items;
  List<Invoice> invoices;
  List<Shipment> shipments;
  DateTime updatedAt;
  DateTime createdAt;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    incrementId: json["increment_id"],
    status: json["status"],
    statusLabel: json["status_label"],
    channelName: json["channel_name"],
    isGuest: json["is_guest"],
    customerEmail: json["customer_email"],
    customerFirstName: json["customer_first_name"],
    customerLastName: json["customer_last_name"],
    shippingMethod: json["shipping_method"],
    shippingTitle: json["shipping_title"],
    paymentTitle: json["payment_title"],
    shippingDescription: json["shipping_description"],
    couponCode: json["coupon_code"],
    isGift: json["is_gift"],
    totalItemCount: json["total_item_count"],
    totalQtyOrdered: json["total_qty_ordered"],
    baseCurrencyCode: json["base_currency_code"],
    channelCurrencyCode: json["channel_currency_code"],
    orderCurrencyCode: json["order_currency_code"],
    grandTotal: json["grand_total"],
    formatedGrandTotal: json["formated_grand_total"],
    baseGrandTotal: json["base_grand_total"],
    formatedBaseGrandTotal: json["formated_base_grand_total"],
    grandTotalInvoiced: json["grand_total_invoiced"],
    formatedGrandTotalInvoiced: json["formated_grand_total_invoiced"],
    baseGrandTotalInvoiced: json["base_grand_total_invoiced"],
    formatedBaseGrandTotalInvoiced: json["formated_base_grand_total_invoiced"],
    grandTotalRefunded: json["grand_total_refunded"],
    formatedGrandTotalRefunded: json["formated_grand_total_refunded"],
    baseGrandTotalRefunded: json["base_grand_total_refunded"],
    formatedBaseGrandTotalRefunded: json["formated_base_grand_total_refunded"],
    subTotal: json["sub_total"],
    formatedSubTotal: json["formated_sub_total"],
    baseSubTotal: json["base_sub_total"],
    formatedBaseSubTotal: json["formated_base_sub_total"],
    subTotalInvoiced: json["sub_total_invoiced"],
    formatedSubTotalInvoiced: json["formated_sub_total_invoiced"],
    baseSubTotalInvoiced: json["base_sub_total_invoiced"],
    formatedBaseSubTotalInvoiced: json["formated_base_sub_total_invoiced"],
    subTotalRefunded: json["sub_total_refunded"],
    formatedSubTotalRefunded: json["formated_sub_total_refunded"],
    discountPercent: json["discount_percent"],
    discountAmount: json["discount_amount"],
    formatedDiscountAmount: json["formated_discount_amount"],
    baseDiscountAmount: json["base_discount_amount"],
    formatedBaseDiscountAmount: json["formated_base_discount_amount"],
    discountInvoiced: json["discount_invoiced"],
    formatedDiscountInvoiced: json["formated_discount_invoiced"],
    baseDiscountInvoiced: json["base_discount_invoiced"],
    formatedBaseDiscountInvoiced: json["formated_base_discount_invoiced"],
    discountRefunded: json["discount_refunded"],
    formatedDiscountRefunded: json["formated_discount_refunded"],
    baseDiscountRefunded: json["base_discount_refunded"],
    formatedBaseDiscountRefunded: json["formated_base_discount_refunded"],
    taxAmount: json["tax_amount"],
    formatedTaxAmount: json["formated_tax_amount"],
    baseTaxAmount: json["base_tax_amount"],
    formatedBaseTaxAmount: json["formated_base_tax_amount"],
    taxAmountInvoiced: json["tax_amount_invoiced"],
    formatedTaxAmountInvoiced: json["formated_tax_amount_invoiced"],
    baseTaxAmountInvoiced: json["base_tax_amount_invoiced"],
    formatedBaseTaxAmountInvoiced: json["formated_base_tax_amount_invoiced"],
    taxAmountRefunded: json["tax_amount_refunded"],
    formatedTaxAmountRefunded: json["formated_tax_amount_refunded"],
    baseTaxAmountRefunded: json["base_tax_amount_refunded"],
    formatedBaseTaxAmountRefunded: json["formated_base_tax_amount_refunded"],
    shippingAmount: json["shipping_amount"],
    formatedShippingAmount: json["formated_shipping_amount"],
    baseShippingAmount: json["base_shipping_amount"],
    formatedBaseShippingAmount: json["formated_base_shipping_amount"],
    shippingInvoiced: json["shipping_invoiced"],
    formatedShippingInvoiced: json["formated_shipping_invoiced"],
    baseShippingInvoiced: json["base_shipping_invoiced"],
    formatedBaseShippingInvoiced: json["formated_base_shipping_invoiced"],
    shippingRefunded: json["shipping_refunded"],
    formatedShippingRefunded: json["formated_shipping_refunded"],
    baseShippingRefunded: json["base_shipping_refunded"],
    formatedBaseShippingRefunded: json["formated_base_shipping_refunded"],
    customer: CustomerData.Data.fromJson(json["customer"]),
    channel: Channel.fromJson(json["channel"]),
    shippingAddress: Address.fromJson(json["shipping_address"]),
    billingAddress: Address.fromJson(json["billing_address"]),
    items: List<DatumItem>.from(json["items"].map((x) => DatumItem.fromJson(x))),
    invoices: List<Invoice>.from(json["invoices"].map((x) => Invoice.fromJson(x))),
    shipments: List<Shipment>.from(json["shipments"].map((x) => Shipment.fromJson(x))),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "increment_id": incrementId,
    "status": status,
    "status_label": statusLabel,
    "channel_name": channelName,
    "is_guest": isGuest,
    "customer_email": customerEmail,
    "customer_first_name": customerFirstName,
    "customer_last_name": customerLastName,
    "shipping_method": shippingMethod,
    "shipping_title": shippingTitle,
    "payment_title": paymentTitle,
    "shipping_description": shippingDescription,
    "coupon_code": couponCode,
    "is_gift": isGift,
    "total_item_count": totalItemCount,
    "total_qty_ordered": totalQtyOrdered,
    "base_currency_code": baseCurrencyCode,
    "channel_currency_code": channelCurrencyCode,
    "order_currency_code": orderCurrencyCode,
    "grand_total": grandTotal,
    "formated_grand_total": formatedGrandTotal,
    "base_grand_total": baseGrandTotal,
    "formated_base_grand_total": formatedBaseGrandTotal,
    "grand_total_invoiced": grandTotalInvoiced,
    "formated_grand_total_invoiced": formatedGrandTotalInvoiced,
    "base_grand_total_invoiced": baseGrandTotalInvoiced,
    "formated_base_grand_total_invoiced": formatedBaseGrandTotalInvoiced,
    "grand_total_refunded": grandTotalRefunded,
    "formated_grand_total_refunded": formatedGrandTotalRefunded,
    "base_grand_total_refunded": baseGrandTotalRefunded,
    "formated_base_grand_total_refunded": formatedBaseGrandTotalRefunded,
    "sub_total": subTotal,
    "formated_sub_total": formatedSubTotal,
    "base_sub_total": baseSubTotal,
    "formated_base_sub_total": formatedBaseSubTotal,
    "sub_total_invoiced": subTotalInvoiced,
    "formated_sub_total_invoiced": formatedSubTotalInvoiced,
    "base_sub_total_invoiced": baseSubTotalInvoiced,
    "formated_base_sub_total_invoiced": formatedBaseSubTotalInvoiced,
    "sub_total_refunded": subTotalRefunded,
    "formated_sub_total_refunded": formatedSubTotalRefunded,
    "discount_percent": discountPercent,
    "discount_amount": discountAmount,
    "formated_discount_amount": formatedDiscountAmount,
    "base_discount_amount": baseDiscountAmount,
    "formated_base_discount_amount": formatedBaseDiscountAmount,
    "discount_invoiced": discountInvoiced,
    "formated_discount_invoiced": formatedDiscountInvoiced,
    "base_discount_invoiced": baseDiscountInvoiced,
    "formated_base_discount_invoiced": formatedBaseDiscountInvoiced,
    "discount_refunded": discountRefunded,
    "formated_discount_refunded": formatedDiscountRefunded,
    "base_discount_refunded": baseDiscountRefunded,
    "formated_base_discount_refunded": formatedBaseDiscountRefunded,
    "tax_amount": taxAmount,
    "formated_tax_amount": formatedTaxAmount,
    "base_tax_amount": baseTaxAmount,
    "formated_base_tax_amount": formatedBaseTaxAmount,
    "tax_amount_invoiced": taxAmountInvoiced,
    "formated_tax_amount_invoiced": formatedTaxAmountInvoiced,
    "base_tax_amount_invoiced": baseTaxAmountInvoiced,
    "formated_base_tax_amount_invoiced": formatedBaseTaxAmountInvoiced,
    "tax_amount_refunded": taxAmountRefunded,
    "formated_tax_amount_refunded": formatedTaxAmountRefunded,
    "base_tax_amount_refunded": baseTaxAmountRefunded,
    "formated_base_tax_amount_refunded": formatedBaseTaxAmountRefunded,
    "shipping_amount": shippingAmount,
    "formated_shipping_amount": formatedShippingAmount,
    "base_shipping_amount": baseShippingAmount,
    "formated_base_shipping_amount": formatedBaseShippingAmount,
    "shipping_invoiced": shippingInvoiced,
    "formated_shipping_invoiced": formatedShippingInvoiced,
    "base_shipping_invoiced": baseShippingInvoiced,
    "formated_base_shipping_invoiced": formatedBaseShippingInvoiced,
    "shipping_refunded": shippingRefunded,
    "formated_shipping_refunded": formatedShippingRefunded,
    "base_shipping_refunded": baseShippingRefunded,
    "formated_base_shipping_refunded": formatedBaseShippingRefunded,
    "customer": customer.toJson(),
    "channel": channel.toJson(),
    "shipping_address": shippingAddress.toJson(),
    "billing_address": billingAddress.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "invoices": List<dynamic>.from(invoices.map((x) => x.toJson())),
    "shipments": List<dynamic>.from(shipments.map((x) => x.toJson())),
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
  };
}

class Channel {
  Channel({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.timezone,
    required this.theme,
    required this.homePageContent,
    required this.footerContent,
    required this.hostname,
    required this.logo,
    required this.logoUrl,
    required this.favicon,
    required this.faviconUrl,
    required this.defaultLocale,
    required this.rootCategoryId,
    required this.rootCategory,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String code;
  String name;
  dynamic description;
  dynamic timezone;
  String theme;
  String homePageContent;
  String footerContent;
  String hostname;
  dynamic logo;
  dynamic logoUrl;
  dynamic favicon;
  dynamic faviconUrl;
  DefaultLocale defaultLocale;
  int rootCategoryId;
  RootCategory rootCategory;
  dynamic createdAt;
  dynamic updatedAt;

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    description: json["description"],
    timezone: json["timezone"],
    theme: json["theme"],
    homePageContent: json["home_page_content"],
    footerContent: json["footer_content"],
    hostname: json["hostname"],
    logo: json["logo"],
    logoUrl: json["logo_url"],
    favicon: json["favicon"],
    faviconUrl: json["favicon_url"],
    defaultLocale: DefaultLocale.fromJson(json["default_locale"]),
    rootCategoryId: json["root_category_id"],
    rootCategory: RootCategory.fromJson(json["root_category"]),
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "description": description,
    "timezone": timezone,
    "theme": theme,
    "home_page_content": homePageContent,
    "footer_content": footerContent,
    "hostname": hostname,
    "logo": logo,
    "logo_url": logoUrl,
    "favicon": favicon,
    "favicon_url": faviconUrl,
    "default_locale": defaultLocale.toJson(),
    "root_category_id": rootCategoryId,
    "root_category": rootCategory.toJson(),
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class DefaultLocale {
  DefaultLocale({
    required this.id,
    required this.code,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String? code;
  String name;
  dynamic createdAt;
  dynamic updatedAt;

  factory DefaultLocale.fromJson(Map<String, dynamic> json) => DefaultLocale(
    id: json["id"],
    code: json["code"] ?? null,
    name: json["name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code == null ? null : code,
    "name": name,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class RootCategory {
  RootCategory({
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

  int id;
  dynamic code;
  String name;
  String slug;
  String displayMode;
  String description;
  String metaTitle;
  String metaDescription;
  String metaKeywords;
  int status;
  dynamic imageUrl;
  dynamic categoryIconPath;
  dynamic additional;
  DateTime createdAt;
  DateTime updatedAt;

  factory RootCategory.fromJson(Map<String, dynamic> json) => RootCategory(
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

class Invoice {
  Invoice({
    required this.id,
    required this.state,
    required this.emailSent,
    required this.totalQty,
    required this.baseCurrencyCode,
    required this.channelCurrencyCode,
    required this.orderCurrencyCode,
    required this.subTotal,
    required this.formatedSubTotal,
    required this.baseSubTotal,
    required this.formatedBaseSubTotal,
    required this.grandTotal,
    required this.formatedGrandTotal,
    required this.baseGrandTotal,
    required this.formatedBaseGrandTotal,
    required this.shippingAmount,
    required this.formatedShippingAmount,
    required this.baseShippingAmount,
    required this.formatedBaseShippingAmount,
    required this.taxAmount,
    required this.formatedTaxAmount,
    required this.baseTaxAmount,
    required this.formatedBaseTaxAmount,
    required this.discountAmount,
    required this.formatedDiscountAmount,
    required this.baseDiscountAmount,
    required this.formatedBaseDiscountAmount,
    required this.orderAddress,
    required this.transactionId,
    required this.items,
    required this.createdAt,
  });

  int id;
  String state;
  int emailSent;
  int totalQty;
  String baseCurrencyCode;
  String channelCurrencyCode;
  String orderCurrencyCode;
  String subTotal;
  String formatedSubTotal;
  String baseSubTotal;
  String formatedBaseSubTotal;
  String grandTotal;
  String formatedGrandTotal;
  String baseGrandTotal;
  String formatedBaseGrandTotal;
  String shippingAmount;
  String formatedShippingAmount;
  String baseShippingAmount;
  String formatedBaseShippingAmount;
  String taxAmount;
  String formatedTaxAmount;
  String baseTaxAmount;
  String formatedBaseTaxAmount;
  String discountAmount;
  String formatedDiscountAmount;
  String baseDiscountAmount;
  String formatedBaseDiscountAmount;
  Address orderAddress;
  dynamic transactionId;
  List<InvoiceItem> items;
  DateTime createdAt;

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
    id: json["id"],
    state: json["state"],
    emailSent: json["email_sent"],
    totalQty: json["total_qty"],
    baseCurrencyCode: json["base_currency_code"],
    channelCurrencyCode: json["channel_currency_code"],
    orderCurrencyCode: json["order_currency_code"],
    subTotal: json["sub_total"],
    formatedSubTotal: json["formated_sub_total"],
    baseSubTotal: json["base_sub_total"],
    formatedBaseSubTotal: json["formated_base_sub_total"],
    grandTotal: json["grand_total"],
    formatedGrandTotal: json["formated_grand_total"],
    baseGrandTotal: json["base_grand_total"],
    formatedBaseGrandTotal: json["formated_base_grand_total"],
    shippingAmount: json["shipping_amount"],
    formatedShippingAmount: json["formated_shipping_amount"],
    baseShippingAmount: json["base_shipping_amount"],
    formatedBaseShippingAmount: json["formated_base_shipping_amount"],
    taxAmount: json["tax_amount"],
    formatedTaxAmount: json["formated_tax_amount"],
    baseTaxAmount: json["base_tax_amount"],
    formatedBaseTaxAmount: json["formated_base_tax_amount"],
    discountAmount: json["discount_amount"],
    formatedDiscountAmount: json["formated_discount_amount"],
    baseDiscountAmount: json["base_discount_amount"],
    formatedBaseDiscountAmount: json["formated_base_discount_amount"],
    orderAddress: Address.fromJson(json["order_address"]),
    transactionId: json["transaction_id"],
    items: List<InvoiceItem>.from(json["items"].map((x) => InvoiceItem.fromJson(x))),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "state": state,
    "email_sent": emailSent,
    "total_qty": totalQty,
    "base_currency_code": baseCurrencyCode,
    "channel_currency_code": channelCurrencyCode,
    "order_currency_code": orderCurrencyCode,
    "sub_total": subTotal,
    "formated_sub_total": formatedSubTotal,
    "base_sub_total": baseSubTotal,
    "formated_base_sub_total": formatedBaseSubTotal,
    "grand_total": grandTotal,
    "formated_grand_total": formatedGrandTotal,
    "base_grand_total": baseGrandTotal,
    "formated_base_grand_total": formatedBaseGrandTotal,
    "shipping_amount": shippingAmount,
    "formated_shipping_amount": formatedShippingAmount,
    "base_shipping_amount": baseShippingAmount,
    "formated_base_shipping_amount": formatedBaseShippingAmount,
    "tax_amount": taxAmount,
    "formated_tax_amount": formatedTaxAmount,
    "base_tax_amount": baseTaxAmount,
    "formated_base_tax_amount": formatedBaseTaxAmount,
    "discount_amount": discountAmount,
    "formated_discount_amount": formatedDiscountAmount,
    "base_discount_amount": baseDiscountAmount,
    "formated_base_discount_amount": formatedBaseDiscountAmount,
    "order_address": orderAddress.toJson(),
    "transaction_id": transactionId,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "created_at": createdAt.toIso8601String(),
  };
}

class InvoiceItem {
  InvoiceItem({
    required this.id,
    required this.name,
    required this.description,
    required this.sku,
    required this.qty,
    required this.price,
    required this.formatedPrice,
    required this.basePrice,
    required this.formatedBasePrice,
    required this.total,
    required this.formatedTotal,
    required this.baseTotal,
    required this.formatedBaseTotal,
    required this.taxAmount,
    required this.formatedTaxAmount,
    required this.baseTaxAmount,
    required this.formatedBaseTaxAmount,
    required this.grandTotal,
    required this.formatedGrandTotal,
    required this.baseGrandTotal,
    required this.formatedBaseGrandTotal,
    required this.additional,
    required this.child,
    required this.children,
  });

  int id;
  String name;
  dynamic description;
  String sku;
  int qty;
  String price;
  String formatedPrice;
  String basePrice;
  String formatedBasePrice;
  String total;
  String formatedTotal;
  String baseTotal;
  String formatedBaseTotal;
  String taxAmount;
  String formatedTaxAmount;
  String baseTaxAmount;
  String formatedBaseTaxAmount;
  double grandTotal;
  String formatedGrandTotal;
  double baseGrandTotal;
  String formatedBaseGrandTotal;
  Additional additional;
  dynamic child;
  List<dynamic> children;

  factory InvoiceItem.fromJson(Map<String, dynamic> json) => InvoiceItem(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    sku: json["sku"],
    qty: json["qty"],
    price: json["price"],
    formatedPrice: json["formated_price"],
    basePrice: json["base_price"],
    formatedBasePrice: json["formated_base_price"],
    total: json["total"],
    formatedTotal: json["formated_total"],
    baseTotal: json["base_total"],
    formatedBaseTotal: json["formated_base_total"],
    taxAmount: json["tax_amount"],
    formatedTaxAmount: json["formated_tax_amount"],
    baseTaxAmount: json["base_tax_amount"],
    formatedBaseTaxAmount: json["formated_base_tax_amount"],
    grandTotal: json["grand_total"],
    formatedGrandTotal: json["formated_grand_total"],
    baseGrandTotal: json["base_grand_total"],
    formatedBaseGrandTotal: json["formated_base_grand_total"],
    additional: Additional.fromJson(json["additional"]),
    child: json["child"],
    children: List<dynamic>.from(json["children"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "sku": sku,
    "qty": qty,
    "price": price,
    "formated_price": formatedPrice,
    "base_price": basePrice,
    "formated_base_price": formatedBasePrice,
    "total": total,
    "formated_total": formatedTotal,
    "base_total": baseTotal,
    "formated_base_total": formatedBaseTotal,
    "tax_amount": taxAmount,
    "formated_tax_amount": formatedTaxAmount,
    "base_tax_amount": baseTaxAmount,
    "formated_base_tax_amount": formatedBaseTaxAmount,
    "grand_total": grandTotal,
    "formated_grand_total": formatedGrandTotal,
    "base_grand_total": baseGrandTotal,
    "formated_base_grand_total": formatedBaseGrandTotal,
    "additional": additional.toJson(),
    "child": child,
    "children": List<dynamic>.from(children.map((x) => x)),
  };
}

class Additional {
  Additional({
    required this.quantity,
    required this.productId,
    required this.token,
    required this.locale,
  });

  int quantity;
  String productId;
  String token;
  String locale;

  factory Additional.fromJson(Map<String, dynamic> json) => Additional(
    quantity: json["quantity"],
    productId: json["product_id"],
    token: json["_token"],
    locale: json["locale"],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "product_id": productId,
    "_token": token,
    "locale": locale,
  };
}

class DatumItem {
  DatumItem({
    required this.id,
    required this.sku,
    required this.type,
    required this.name,
    required this.product,
    required this.couponCode,
    required this.weight,
    required this.totalWeight,
    required this.qtyOrdered,
    required this.qtyCanceled,
    required this.qtyInvoiced,
    required this.qtyShipped,
    required this.qtyRefunded,
    required this.price,
    required this.formatedPrice,
    required this.basePrice,
    required this.formatedBasePrice,
    required this.total,
    required this.formatedTotal,
    required this.baseTotal,
    required this.formatedBaseTotal,
    required this.totalInvoiced,
    required this.formatedTotalInvoiced,
    required this.baseTotalInvoiced,
    required this.formatedBaseTotalInvoiced,
    required this.amountRefunded,
    required this.formatedAmountRefunded,
    required this.baseAmountRefunded,
    required this.formatedBaseAmountRefunded,
    required this.discountPercent,
    required this.discountAmount,
    required this.formatedDiscountAmount,
    required this.baseDiscountAmount,
    required this.formatedBaseDiscountAmount,
    required this.discountInvoiced,
    required this.formatedDiscountInvoiced,
    required this.baseDiscountInvoiced,
    required this.formatedBaseDiscountInvoiced,
    required this.discountRefunded,
    required this.formatedDiscountRefunded,
    required this.baseDiscountRefunded,
    required this.formatedBaseDiscountRefunded,
    required this.taxPercent,
    required this.taxAmount,
    required this.formatedTaxAmount,
    required this.baseTaxAmount,
    required this.formatedBaseTaxAmount,
    required this.taxAmountInvoiced,
    required this.formatedTaxAmountInvoiced,
    required this.baseTaxAmountInvoiced,
    required this.formatedBaseTaxAmountInvoiced,
    required this.taxAmountRefunded,
    required this.formatedTaxAmountRefunded,
    required this.baseTaxAmountRefunded,
    required this.formatedBaseTaxAmountRefunded,
    required this.grantTotal,
    required this.formatedGrantTotal,
    required this.baseGrantTotal,
    required this.formatedBaseGrantTotal,
    required this.downloadableLinks,
    required this.additional,
    required this.child,
    required this.children,
  });

  int id;
  String sku;
  String type;
  String name;
  Product product;
  dynamic couponCode;
  String weight;
  String totalWeight;
  int qtyOrdered;
  int qtyCanceled;
  int qtyInvoiced;
  int qtyShipped;
  int qtyRefunded;
  String price;
  String formatedPrice;
  String basePrice;
  String formatedBasePrice;
  String total;
  String formatedTotal;
  String baseTotal;
  String formatedBaseTotal;
  String totalInvoiced;
  String formatedTotalInvoiced;
  String baseTotalInvoiced;
  String formatedBaseTotalInvoiced;
  String amountRefunded;
  String formatedAmountRefunded;
  String baseAmountRefunded;
  String formatedBaseAmountRefunded;
  String discountPercent;
  String discountAmount;
  String formatedDiscountAmount;
  String baseDiscountAmount;
  String formatedBaseDiscountAmount;
  String discountInvoiced;
  String formatedDiscountInvoiced;
  String baseDiscountInvoiced;
  String formatedBaseDiscountInvoiced;
  String discountRefunded;
  String formatedDiscountRefunded;
  String baseDiscountRefunded;
  String formatedBaseDiscountRefunded;
  String taxPercent;
  String taxAmount;
  String formatedTaxAmount;
  String baseTaxAmount;
  String formatedBaseTaxAmount;
  String taxAmountInvoiced;
  String formatedTaxAmountInvoiced;
  String baseTaxAmountInvoiced;
  String formatedBaseTaxAmountInvoiced;
  String taxAmountRefunded;
  String formatedTaxAmountRefunded;
  String baseTaxAmountRefunded;
  String formatedBaseTaxAmountRefunded;
  double grantTotal;
  String formatedGrantTotal;
  double baseGrantTotal;
  String formatedBaseGrantTotal;
  List<dynamic> downloadableLinks;
  Additional additional;
  dynamic child;
  List<dynamic> children;

  factory DatumItem.fromJson(Map<String, dynamic> json) => DatumItem(
    id: json["id"],
    sku: json["sku"],
    type: json["type"],
    name: json["name"],
    product: Product.fromJson(json["product"]),
    couponCode: json["coupon_code"],
    weight: json["weight"],
    totalWeight: json["total_weight"],
    qtyOrdered: json["qty_ordered"],
    qtyCanceled: json["qty_canceled"],
    qtyInvoiced: json["qty_invoiced"],
    qtyShipped: json["qty_shipped"],
    qtyRefunded: json["qty_refunded"],
    price: json["price"],
    formatedPrice: json["formated_price"],
    basePrice: json["base_price"],
    formatedBasePrice: json["formated_base_price"],
    total: json["total"],
    formatedTotal: json["formated_total"],
    baseTotal: json["base_total"],
    formatedBaseTotal: json["formated_base_total"],
    totalInvoiced: json["total_invoiced"],
    formatedTotalInvoiced: json["formated_total_invoiced"],
    baseTotalInvoiced: json["base_total_invoiced"],
    formatedBaseTotalInvoiced: json["formated_base_total_invoiced"],
    amountRefunded: json["amount_refunded"],
    formatedAmountRefunded: json["formated_amount_refunded"],
    baseAmountRefunded: json["base_amount_refunded"],
    formatedBaseAmountRefunded: json["formated_base_amount_refunded"],
    discountPercent: json["discount_percent"],
    discountAmount: json["discount_amount"],
    formatedDiscountAmount: json["formated_discount_amount"],
    baseDiscountAmount: json["base_discount_amount"],
    formatedBaseDiscountAmount: json["formated_base_discount_amount"],
    discountInvoiced: json["discount_invoiced"],
    formatedDiscountInvoiced: json["formated_discount_invoiced"],
    baseDiscountInvoiced: json["base_discount_invoiced"],
    formatedBaseDiscountInvoiced: json["formated_base_discount_invoiced"],
    discountRefunded: json["discount_refunded"],
    formatedDiscountRefunded: json["formated_discount_refunded"],
    baseDiscountRefunded: json["base_discount_refunded"],
    formatedBaseDiscountRefunded: json["formated_base_discount_refunded"],
    taxPercent: json["tax_percent"],
    taxAmount: json["tax_amount"],
    formatedTaxAmount: json["formated_tax_amount"],
    baseTaxAmount: json["base_tax_amount"],
    formatedBaseTaxAmount: json["formated_base_tax_amount"],
    taxAmountInvoiced: json["tax_amount_invoiced"],
    formatedTaxAmountInvoiced: json["formated_tax_amount_invoiced"],
    baseTaxAmountInvoiced: json["base_tax_amount_invoiced"],
    formatedBaseTaxAmountInvoiced: json["formated_base_tax_amount_invoiced"],
    taxAmountRefunded: json["tax_amount_refunded"],
    formatedTaxAmountRefunded: json["formated_tax_amount_refunded"],
    baseTaxAmountRefunded: json["base_tax_amount_refunded"],
    formatedBaseTaxAmountRefunded: json["formated_base_tax_amount_refunded"],
    grantTotal: json["grant_total"],
    formatedGrantTotal: json["formated_grant_total"],
    baseGrantTotal: json["base_grant_total"],
    formatedBaseGrantTotal: json["formated_base_grant_total"],
    downloadableLinks: List<dynamic>.from(json["downloadable_links"].map((x) => x)),
    additional: Additional.fromJson(json["additional"]),
    child: json["child"],
    children: List<dynamic>.from(json["children"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "type": type,
    "name": name,
    "product": product.toJson(),
    "coupon_code": couponCode,
    "weight": weight,
    "total_weight": totalWeight,
    "qty_ordered": qtyOrdered,
    "qty_canceled": qtyCanceled,
    "qty_invoiced": qtyInvoiced,
    "qty_shipped": qtyShipped,
    "qty_refunded": qtyRefunded,
    "price": price,
    "formated_price": formatedPrice,
    "base_price": basePrice,
    "formated_base_price": formatedBasePrice,
    "total": total,
    "formated_total": formatedTotal,
    "base_total": baseTotal,
    "formated_base_total": formatedBaseTotal,
    "total_invoiced": totalInvoiced,
    "formated_total_invoiced": formatedTotalInvoiced,
    "base_total_invoiced": baseTotalInvoiced,
    "formated_base_total_invoiced": formatedBaseTotalInvoiced,
    "amount_refunded": amountRefunded,
    "formated_amount_refunded": formatedAmountRefunded,
    "base_amount_refunded": baseAmountRefunded,
    "formated_base_amount_refunded": formatedBaseAmountRefunded,
    "discount_percent": discountPercent,
    "discount_amount": discountAmount,
    "formated_discount_amount": formatedDiscountAmount,
    "base_discount_amount": baseDiscountAmount,
    "formated_base_discount_amount": formatedBaseDiscountAmount,
    "discount_invoiced": discountInvoiced,
    "formated_discount_invoiced": formatedDiscountInvoiced,
    "base_discount_invoiced": baseDiscountInvoiced,
    "formated_base_discount_invoiced": formatedBaseDiscountInvoiced,
    "discount_refunded": discountRefunded,
    "formated_discount_refunded": formatedDiscountRefunded,
    "base_discount_refunded": baseDiscountRefunded,
    "formated_base_discount_refunded": formatedBaseDiscountRefunded,
    "tax_percent": taxPercent,
    "tax_amount": taxAmount,
    "formated_tax_amount": formatedTaxAmount,
    "base_tax_amount": baseTaxAmount,
    "formated_base_tax_amount": formatedBaseTaxAmount,
    "tax_amount_invoiced": taxAmountInvoiced,
    "formated_tax_amount_invoiced": formatedTaxAmountInvoiced,
    "base_tax_amount_invoiced": baseTaxAmountInvoiced,
    "formated_base_tax_amount_invoiced": formatedBaseTaxAmountInvoiced,
    "tax_amount_refunded": taxAmountRefunded,
    "formated_tax_amount_refunded": formatedTaxAmountRefunded,
    "base_tax_amount_refunded": baseTaxAmountRefunded,
    "formated_base_tax_amount_refunded": formatedBaseTaxAmountRefunded,
    "grant_total": grantTotal,
    "formated_grant_total": formatedGrantTotal,
    "base_grant_total": baseGrantTotal,
    "formated_base_grant_total": formatedBaseGrantTotal,
    "downloadable_links": List<dynamic>.from(downloadableLinks.map((x) => x)),
    "additional": additional.toJson(),
    "child": child,
    "children": List<dynamic>.from(children.map((x) => x)),
  };
}

class Shipment {
  Shipment({
    required this.id,
    required this.status,
    required this.totalQty,
    required this.totalWeight,
    required this.carrierCode,
    required this.carrierTitle,
    required this.trackNumber,
    required this.emailSent,
    required this.customer,
    required this.inventorySource,
    required this.items,
  });

  int id;
  dynamic status;
  int totalQty;
  dynamic totalWeight;
  dynamic carrierCode;
  String carrierTitle;
  String trackNumber;
  int emailSent;
  CustomerData.Data customer;
  InventorySource inventorySource;
  List<ShipmentItem> items;

  factory Shipment.fromJson(Map<String, dynamic> json) => Shipment(
    id: json["id"],
    status: json["status"],
    totalQty: json["total_qty"],
    totalWeight: json["total_weight"],
    carrierCode: json["carrier_code"],
    carrierTitle: json["carrier_title"],
    trackNumber: json["track_number"],
    emailSent: json["email_sent"],
    customer: CustomerData.Data.fromJson(json["customer"]),
    inventorySource: InventorySource.fromJson(json["inventory_source"]),
    items: List<ShipmentItem>.from(json["items"].map((x) => ShipmentItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "total_qty": totalQty,
    "total_weight": totalWeight,
    "carrier_code": carrierCode,
    "carrier_title": carrierTitle,
    "track_number": trackNumber,
    "email_sent": emailSent,
    "customer": customer.toJson(),
    "inventory_source": inventorySource.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class InventorySource {
  InventorySource({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.contactName,
    required this.contactEmail,
    required this.contactNumber,
    required this.contactFax,
    required this.country,
    required this.state,
    required this.city,
    required this.street,
    required this.postcode,
    required this.priority,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String code;
  String name;
  dynamic description;
  String contactName;
  String contactEmail;
  String contactNumber;
  dynamic contactFax;
  String country;
  String state;
  String city;
  String street;
  String postcode;
  int priority;
  dynamic latitude;
  dynamic longitude;
  int status;
  dynamic createdAt;
  dynamic updatedAt;

  factory InventorySource.fromJson(Map<String, dynamic> json) => InventorySource(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    description: json["description"],
    contactName: json["contact_name"],
    contactEmail: json["contact_email"],
    contactNumber: json["contact_number"],
    contactFax: json["contact_fax"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    street: json["street"],
    postcode: json["postcode"],
    priority: json["priority"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "description": description,
    "contact_name": contactName,
    "contact_email": contactEmail,
    "contact_number": contactNumber,
    "contact_fax": contactFax,
    "country": country,
    "state": state,
    "city": city,
    "street": street,
    "postcode": postcode,
    "priority": priority,
    "latitude": latitude,
    "longitude": longitude,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class ShipmentItem {
  ShipmentItem({
    required this.id,
    required this.name,
    required this.description,
    required this.sku,
    required this.qty,
    required this.weight,
    required this.price,
    required this.formatedPrice,
    required this.basePrice,
    required this.formatedBasePrice,
    required this.total,
    required this.formatedTotal,
    required this.baseTotal,
    required this.formatedBaseTotal,
    required this.additional,
  });

  int id;
  String name;
  dynamic description;
  String sku;
  int qty;
  int weight;
  String price;
  String formatedPrice;
  String basePrice;
  String formatedBasePrice;
  String total;
  String formatedTotal;
  String baseTotal;
  String formatedBaseTotal;
  Additional additional;

  factory ShipmentItem.fromJson(Map<String, dynamic> json) => ShipmentItem(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    sku: json["sku"],
    qty: json["qty"],
    weight: json["weight"],
    price: json["price"],
    formatedPrice: json["formated_price"],
    basePrice: json["base_price"],
    formatedBasePrice: json["formated_base_price"],
    total: json["total"],
    formatedTotal: json["formated_total"],
    baseTotal: json["base_total"],
    formatedBaseTotal: json["formated_base_total"],
    additional: Additional.fromJson(json["additional"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "sku": sku,
    "qty": qty,
    "weight": weight,
    "price": price,
    "formated_price": formatedPrice,
    "base_price": basePrice,
    "formated_base_price": formatedBasePrice,
    "total": total,
    "formated_total": formatedTotal,
    "base_total": baseTotal,
    "formated_base_total": formatedBaseTotal,
    "additional": additional.toJson(),
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
  int? from;
  int? lastPage;
  List<Link> links;
  String path;
  int? perPage;
  int? to;
  int? total;

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

  String? url;
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
