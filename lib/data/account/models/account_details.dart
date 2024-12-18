import 'package:rotary_flutter/data/account/models/account.dart';

class AccountDetail extends Account{
  final String? workName;
  final String? telephone;
  final String? workAddress;
  final String? workAddressSub;
  final String? email;

  AccountDetail({
    required super.id,
    required super.name,
    required super.cellphone,
    super.workPositionName,
    super.cardinal,
    super.groupCardinal,
    super.profileImage,
    this.workName,
    this.telephone,
    this.workAddress,
    this.workAddressSub,
    this.email
  });

  factory AccountDetail.fromJson(Map<String, dynamic> json) {
    return AccountDetail(
      id: json['id'],
      name: json['name'],
      cellphone: json['cellphone'],
      workPositionName: json['workPositionName'],
      cardinal: json['cardinal'],
      groupCardinal: json['groupCardinal'],
      profileImage: json['profileImage'],
      workAddress: json['workAddress'],
      workName: json['workName'],
      telephone: json['telephone'],
      workAddressSub: json['workAddressSub'],
      email: json['email']
    );
  }

}