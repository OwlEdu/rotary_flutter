// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: (json['id'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      userPassword: json['userPassword'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      telephone: json['telephone'] as String?,
      cellphone: json['cellphone'] as String?,
      signupYear: (json['signupYear'] as num?)?.toInt(),
      graduationYear: (json['graduationYear'] as num?)?.toInt(),
      birthDate: json['birthDate'] as String?,
      workAddress: json['workAddress'] as String?,
      workAddressSub: json['workAddressSub'] as String?,
      workAddressZipCode: json['workAddressZipCode'] as String?,
      workName: json['workName'] as String?,
      workPositionName: json['workPositionName'] as String?,
      homeAddress: json['homeAddress'] as String?,
      homeAddressSub: json['homeAddressSub'] as String?,
      homeAddressZipCode: json['homeAddressZipCode'] as String?,
      cardinal: json['cardinal'] as String?,
      groupCardinal: json['groupCardinal'] as String?,
      pastCardinal: json['pastCardinal'] as String?,
      android: json['android'] as bool?,
      ios: json['ios'] as bool?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userPassword': instance.userPassword,
      'name': instance.name,
      'email': instance.email,
      'telephone': instance.telephone,
      'cellphone': instance.cellphone,
      'signupYear': instance.signupYear,
      'graduationYear': instance.graduationYear,
      'birthDate': instance.birthDate,
      'workAddress': instance.workAddress,
      'workAddressSub': instance.workAddressSub,
      'workAddressZipCode': instance.workAddressZipCode,
      'workName': instance.workName,
      'workPositionName': instance.workPositionName,
      'homeAddress': instance.homeAddress,
      'homeAddressSub': instance.homeAddressSub,
      'homeAddressZipCode': instance.homeAddressZipCode,
      'cardinal': instance.cardinal,
      'groupCardinal': instance.groupCardinal,
      'pastCardinal': instance.pastCardinal,
      'android': instance.android,
      'ios': instance.ios,
      'active': instance.active,
    };
