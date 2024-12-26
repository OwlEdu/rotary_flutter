import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class Account {
  int? id;
  String? userId;
  String? userPassword;
  String? name;
  String? email;
  String? telephone;
  String? cellphone;
  int? signupYear;
  int? graduationYear;
  String? birthDate;
  String? workAddress;
  String? workAddressSub;
  String? workAddressZipCode;
  String? workName;
  String? workPositionName;
  String? homeAddress;
  String? homeAddressSub;
  String? homeAddressZipCode;
  Cardinal? cardinal;
  Cardinal? groupCardinal;
  Cardinal? pastCardinal;
  bool? android;
  bool? ios;
  bool? active;

  Account(
      {this.id,
        this.userId,
        this.userPassword,
        this.name,
        this.email,
        this.telephone,
        this.cellphone,
        this.signupYear,
        this.graduationYear,
        this.birthDate,
        this.workAddress,
        this.workAddressSub,
        this.workAddressZipCode,
        this.workName,
        this.workPositionName,
        this.homeAddress,
        this.homeAddressSub,
        this.homeAddressZipCode,
        this.cardinal,
        this.groupCardinal,
        this.pastCardinal,
        this.android,
        this.ios,
        this.active});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    userPassword = json['userPassword'];
    name = json['name'];
    email = json['email'];
    telephone = json['telephone'];
    cellphone = json['cellphone'];
    signupYear = json['signupYear'];
    graduationYear = json['graduationYear'];
    birthDate = json['birthDate'];
    workAddress = json['workAddress'];
    workAddressSub = json['workAddressSub'];
    workAddressZipCode = json['workAddressZipCode'];
    workName = json['workName'];
    workPositionName = json['workPositionName'];
    homeAddress = json['homeAddress'];
    homeAddressSub = json['homeAddressSub'];
    homeAddressZipCode = json['homeAddressZipCode'];
    cardinal = json['cardinal'] != null
        ? new Cardinal.fromJson(json['cardinal'])
        : null;
    groupCardinal = json['groupCardinal'] != null
        ? new Cardinal.fromJson(json['groupCardinal'])
        : null;
    pastCardinal = json['pastCardinal'] != null
        ? new Cardinal.fromJson(json['pastCardinal'])
        : null;
    android = json['android'];
    ios = json['ios'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['userPassword'] = this.userPassword;
    data['name'] = this.name;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['cellphone'] = this.cellphone;
    data['signupYear'] = this.signupYear;
    data['graduationYear'] = this.graduationYear;
    data['birthDate'] = this.birthDate;
    data['workAddress'] = this.workAddress;
    data['workAddressSub'] = this.workAddressSub;
    data['workAddressZipCode'] = this.workAddressZipCode;
    data['workName'] = this.workName;
    data['workPositionName'] = this.workPositionName;
    data['homeAddress'] = this.homeAddress;
    data['homeAddressSub'] = this.homeAddressSub;
    data['homeAddressZipCode'] = this.homeAddressZipCode;
    if (this.cardinal != null) {
      data['cardinal'] = this.cardinal!.toJson();
    }
    if (this.groupCardinal != null) {
      data['groupCardinal'] = this.groupCardinal!.toJson();
    }
    if (this.pastCardinal != null) {
      data['pastCardinal'] = this.pastCardinal!.toJson();
    }
    data['android'] = this.android;
    data['ios'] = this.ios;
    data['active'] = this.active;
    return data;
  }
}

@JsonSerializable()
class Cardinal {
  int? id;
  String? name;
  String? positionName;
  int? order;
  int? groupOrder;
  bool? active;

  Cardinal(
      {this.id,
        this.name,
        this.positionName,
        this.order,
        this.groupOrder,
        this.active});

  Cardinal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    positionName = json['positionName'];
    order = json['order'];
    groupOrder = json['groupOrder'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['positionName'] = this.positionName;
    data['order'] = this.order;
    data['groupOrder'] = this.groupOrder;
    data['active'] = this.active;
    return data;
  }
}