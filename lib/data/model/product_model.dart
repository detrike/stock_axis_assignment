import 'dart:convert';

ProductModel littleMastersModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String littleMastersModelToJson(ProductModel data) =>
    json.encode(data.toJson());

class ProductModel {
  List<Data>? data;

  ProductModel({
    this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        data: json["data"] != null
            ? List<Data>.from(json["data"].map((x) => Data.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "data": data != null
            ? List<dynamic>.from(data!.map((x) => x.toJson()))
            : [],
      };
}

class Data {
  String? pCode;
  String? pDescription;
  String? pAmount;
  String? pDuration;
  String? pkgName;
  String? comboOffer;
  String? alertMsg;
  String? couponCode;
  int? srNo;
  String? pTotaAmount;

  Data({
    this.pCode,
    this.pDescription,
    this.pAmount,
    this.pDuration,
    this.pkgName,
    this.comboOffer,
    this.alertMsg,
    this.couponCode,
    this.srNo,
    this.pTotaAmount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pCode: json["PCode"],
        pDescription: json["PDescription"],
        pAmount: json["PAmount"],
        pDuration: json["PDuration"],
        pkgName: json["PKGName"],
        comboOffer: json["ComboOffer"],
        alertMsg: json["AlertMsg"],
        couponCode: json["CouponCode"],
        srNo: json["SrNo"],
        pTotaAmount: json["PTotaAmount"],
      );

  Map<String, dynamic> toJson() => {
        "PCode": pCode,
        "PDescription": pDescription,
        "PAmount": pAmount,
        "PDuration": pDuration,
        "PKGName": pkgName,
        "ComboOffer": comboOffer,
        "AlertMsg": alertMsg,
        "CouponCode": couponCode,
        "SrNo": srNo,
        "PTotaAmount": pTotaAmount,
      };
}
