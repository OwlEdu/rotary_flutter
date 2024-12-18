class Account {
  final int? id;
  final String name;
  final String cellphone;
  final String? workPositionName;
  final String? cardinal;
  final String? groupCardinal;
  final String? profileImage;

  Account({
    this.id,
    required this.name,
    required this.cellphone,
    this.workPositionName,
    this.cardinal,
    this.groupCardinal,
    this.profileImage
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      name: json['name'],
      cellphone: json['cellphone'],
      workPositionName: json['workPositionName'],
      cardinal: json['cardinal'],
      groupCardinal: json['groupCardinal'],
      profileImage: json['profileImage']
    );
  }
}


