import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'api.dart';
import 'check_response.dart';

class ApiService {
  /// sent the model
  static Future<dynamic> getData() async {
    try {
      final res = await Api().get(endPoint: "endPoint");
      await CheckResponse.checkReposeError(res);
      // return model ma convert kari ne return;
    } catch (e, st) {
      log("handleAccount catchBloc error: $e && st: $st");
      rethrow;
    }
  }
}

String tojsoncoverteddata(List<Asd> hey) =>
    jsonEncode(List<dynamic>.from(hey.map((e) => e.toJson())));

class Asd {
  String? productId;
  String? authorId;
  String? productSku;
  String? productHsn;
  String? productName;
  String? cname;
  String? productSeoUrl;
  String? productImage;
  String? productQty;
  String? catalogPcs;
  String? productPrice;
  String? productMrpPrice;
  String? productSalePrice;
  String? productResellerPrice;
  String? productResellerMrpPrice;
  String? productResellerSalePrice;
  String? productGst;
  String? productWeight;
  String? productStitch;
  String? catalogType;
  String? moq;
  String? topFabric;
  String? bottomFabric;
  String? dupattaFabric;
  String? sareeFabric;
  String? blouseFabric;
  String? lehengaFabric;
  String? innerFor;
  String? cutfab;
  String? color;
  String? bottom;
  String? length;
  String? accessoriesLength;
  String? productShortDescription;
  String? productFullDescription;
  String? productStatus;
  String? productMetaTitle;
  String? productMetaKeyword;
  String? productMetaDescription;
  String? disableDate;
  String? upcoming;
  String? productType;
  String? videoLink;
  String? otherDetail;
  String? singleCatalog;
  String? productDate;
  String? pushToTopDate;
  String? deliveryDate;
  String? fabric;
  String? availability;
  String? permalink;
  String? filter;
  String? codeUserid;

  Asd(
      {this.productId,
      this.authorId,
      this.productSku,
      this.productHsn,
      this.productName,
      this.cname,
      this.productSeoUrl,
      this.productImage,
      this.productQty,
      this.catalogPcs,
      this.productPrice,
      this.productMrpPrice,
      this.productSalePrice,
      this.productResellerPrice,
      this.productResellerMrpPrice,
      this.productResellerSalePrice,
      this.productGst,
      this.productWeight,
      this.productStitch,
      this.catalogType,
      this.moq,
      this.topFabric,
      this.bottomFabric,
      this.dupattaFabric,
      this.sareeFabric,
      this.blouseFabric,
      this.lehengaFabric,
      this.innerFor,
      this.cutfab,
      this.color,
      this.bottom,
      this.length,
      this.accessoriesLength,
      this.productShortDescription,
      this.productFullDescription,
      this.productStatus,
      this.productMetaTitle,
      this.productMetaKeyword,
      this.productMetaDescription,
      this.disableDate,
      this.upcoming,
      this.productType,
      this.videoLink,
      this.otherDetail,
      this.singleCatalog,
      this.productDate,
      this.pushToTopDate,
      this.deliveryDate,
      this.fabric,
      this.availability,
      this.permalink,
      this.filter,
      this.codeUserid});

  Asd.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    authorId = json['author_id'];
    productSku = json['product_sku'];
    productHsn = json['product_hsn'];
    productName = json['product_name'];
    cname = json['cname'];
    productSeoUrl = json['product_seo_url'];
    productImage = json['product_image'];
    productQty = json['product_qty'];
    catalogPcs = json['catalog_pcs'];
    productPrice = json['product_price'];
    productMrpPrice = json['product_mrp_price'];
    productSalePrice = json['product_sale_price'];
    productResellerPrice = json['product_reseller_price'];
    productResellerMrpPrice = json['product_reseller_mrp_price'];
    productResellerSalePrice = json['product_reseller_sale_price'];
    productGst = json['product_gst'];
    productWeight = json['product_weight'];
    productStitch = json['product_stitch'];
    catalogType = json['catalog_type'];
    moq = json['moq'];
    topFabric = json['top_fabric'];
    bottomFabric = json['bottom_fabric'];
    dupattaFabric = json['dupatta_fabric'];
    sareeFabric = json['saree_fabric'];
    blouseFabric = json['blouse_fabric'];
    lehengaFabric = json['lehenga_fabric'];
    innerFor = json['inner_for'];
    cutfab = json['cutfab'];
    color = json['color'];
    bottom = json['bottom'];
    length = json['length'];
    accessoriesLength = json['accessories_length'];
    productShortDescription = json['product_short_description'];
    productFullDescription = json['product_full_description'];
    productStatus = json['product_status'];
    productMetaTitle = json['product_meta_title'];
    productMetaKeyword = json['product_meta_keyword'];
    productMetaDescription = json['product_meta_description'];
    disableDate = json['disable_date'];
    upcoming = json['upcoming'];
    productType = json['product_type'];
    videoLink = json['video_link'];
    otherDetail = json['other_detail'];
    singleCatalog = json['single_catalog'];
    productDate = json['product_date'];
    pushToTopDate = json['push_to_top_date'];
    deliveryDate = json['delivery_date'];
    fabric = json['fabric'];
    availability = json['availability'];
    permalink = json['permalink'];
    filter = json['filter'];
    codeUserid = json['code_userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['author_id'] = this.authorId;
    data['product_sku'] = this.productSku;
    data['product_hsn'] = this.productHsn;
    data['product_name'] = this.productName;
    data['cname'] = this.cname;
    data['product_seo_url'] = this.productSeoUrl;
    data['product_image'] = this.productImage;
    data['product_qty'] = this.productQty;
    data['catalog_pcs'] = this.catalogPcs;
    data['product_price'] = this.productPrice;
    data['product_mrp_price'] = this.productMrpPrice;
    data['product_sale_price'] = this.productSalePrice;
    data['product_reseller_price'] = this.productResellerPrice;
    data['product_reseller_mrp_price'] = this.productResellerMrpPrice;
    data['product_reseller_sale_price'] = this.productResellerSalePrice;
    data['product_gst'] = this.productGst;
    data['product_weight'] = this.productWeight;
    data['product_stitch'] = this.productStitch;
    data['catalog_type'] = this.catalogType;
    data['moq'] = this.moq;
    data['top_fabric'] = this.topFabric;
    data['bottom_fabric'] = this.bottomFabric;
    data['dupatta_fabric'] = this.dupattaFabric;
    data['saree_fabric'] = this.sareeFabric;
    data['blouse_fabric'] = this.blouseFabric;
    data['lehenga_fabric'] = this.lehengaFabric;
    data['inner_for'] = this.innerFor;
    data['cutfab'] = this.cutfab;
    data['color'] = this.color;
    data['bottom'] = this.bottom;
    data['length'] = this.length;
    data['accessories_length'] = this.accessoriesLength;
    data['product_short_description'] = this.productShortDescription;
    data['product_full_description'] = this.productFullDescription;
    data['product_status'] = this.productStatus;
    data['product_meta_title'] = this.productMetaTitle;
    data['product_meta_keyword'] = this.productMetaKeyword;
    data['product_meta_description'] = this.productMetaDescription;
    data['disable_date'] = this.disableDate;
    data['upcoming'] = this.upcoming;
    data['product_type'] = this.productType;
    data['video_link'] = this.videoLink;
    data['other_detail'] = this.otherDetail;
    data['single_catalog'] = this.singleCatalog;
    data['product_date'] = this.productDate;
    data['push_to_top_date'] = this.pushToTopDate;
    data['delivery_date'] = this.deliveryDate;
    data['fabric'] = this.fabric;
    data['availability'] = this.availability;
    data['permalink'] = this.permalink;
    data['filter'] = this.filter;
    data['code_userid'] = this.codeUserid;
    return data;
  }
}

/*

void removeDotIfNoValueAfterIt() {
  final String value = controller.text;
  if (keyboardType == TextInputType.number && value.isNotEmpty && value[value.length - 1] == '.') {
    controller.text = value.substring(0, value.length - 1);
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }
}
//secound

    pc.catName.value = TextEditingValue(
   text: text,
     selection: TextSelection.collapsed(offset: text.length),
      );
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
*/
