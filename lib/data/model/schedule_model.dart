import 'package:json_annotation/json_annotation.dart';

part 'schedule_model.g.dart';

@JsonSerializable()
class ScheduleModel {
  String? time;
  String? title;
  String? content;

  ScheduleModel({this.time, this.title, this.content});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}
