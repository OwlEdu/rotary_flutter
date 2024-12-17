import 'package:json_annotation/json_annotation.dart';

part 'advertise_model.g.dart';

@JsonSerializable()
class AdvertiseModel {
  String? image;
  String? title;

  AdvertiseModel({this.image, this.title});

  AdvertiseModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    return data;
  }
}