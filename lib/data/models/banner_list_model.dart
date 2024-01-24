import 'banner_item.dart';

class BannerListModel {
  String? msg;
  List<BannerItem>? bannerList;

  BannerListModel({this.msg, this.bannerList});

  BannerListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      bannerList = <BannerItem>[];
      json['data'].forEach((v) {
        bannerList!.add(new BannerItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.bannerList != null) {
      data['data'] = this.bannerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


