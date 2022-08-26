class AddDrivers {
  AddDrivers({
    required this.data1,
  });
  late final Data1 data1;

  AddDrivers.fromJson(Map<String, dynamic> json){
    data1 = Data1.fromJson(json['data1']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data1'] = data1.toJson();
    return _data;
  }
}

class Data1 {
  Data1({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.isDriver,
    this.birthDate,
    required this.drivingLicenseNum,
    required this.expDate,
  });
  late final String name;
  late final String email;
  late final String phoneNumber;
  late final String updatedAt;
  late final String createdAt;
  late final int id;
  late final int isDriver;
  late final Null birthDate;
  late final String drivingLicenseNum;
  late final String expDate;

  Data1.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    isDriver = json['isDriver'];
    birthDate = null;
    drivingLicenseNum = json['driving_license_num'];
    expDate = json['exp_date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['phone_number'] = phoneNumber;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    _data['isDriver'] = isDriver;
    _data['birth_date'] = birthDate;
    _data['driving_license_num'] = drivingLicenseNum;
    _data['exp_date'] = expDate;
    return _data;
  }
}