part of './home_page_states.dart';

class HomePageModel {
  List<ProductModel>? productsList, productSearchList;
  HomePageModel({this.productsList, this.productSearchList});

  HomePageModel.fromJson(Map<String, dynamic> json) {
    if (json['productsList'] != null) {
      productsList = <ProductModel>[];
      json['productsList'].forEach((value) {
        productsList!.add(ProductModel.fromJson(value));
      });
    } else {
      productsList = <ProductModel>[];
    }
    if (json['productSearchList'] != null) {
      productSearchList = <ProductModel>[];
      json['productSearchList'].forEach((value) {
        productSearchList!.add(ProductModel.fromJson(value));
      });
    } else {
      productSearchList = <ProductModel>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productsList'] = productsList!.map((value) => value.toJson()).toList();
    data['productSearchList'] = productSearchList!.map((value) => value.toJson()).toList();
    return data;
  }
}
