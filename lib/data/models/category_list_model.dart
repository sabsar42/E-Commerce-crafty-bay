import 'category_list_item.dart';

class CategoryListModel {
  String? msg;
  List<CategoryListItem>? categoryListItem;

  CategoryListModel({this.msg, this.categoryListItem});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      categoryListItem = <CategoryListItem>[];
      json['data'].forEach((v) {
        categoryListItem!.add(new CategoryListItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.categoryListItem != null) {
      data['data'] = this.categoryListItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


