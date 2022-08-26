class AllDrivers {
  AllDrivers({
  required this.data,
});
late final List<Data> data;

AllDrivers.fromJson(Map<String, dynamic> json){
data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  _data['0'] = 0;
  _data['data'] = data.map((e)=>e.toJson()).toList();
  return _data;
}
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    this.emailVerifiedAt,
    required this.image,
    required this.isAdmin,
    required this.isDriver,
    required this.verficationCode,
    required this.isVarified,
    this.fcmToken,
    required this.createdAt,
    required this.updatedAt,
    required this.driverId,
  });
  late final int id;
  late final String name;
  late final String phoneNumber;
  late final String email;
  late final Null emailVerifiedAt;
  late final String image;
  late final int isAdmin;
  late final int isDriver;
  late final String verficationCode;
  late final String isVarified;
  late final Null fcmToken;
  late final String createdAt;
  late final String updatedAt;
  late final int driverId;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    emailVerifiedAt = null;
    image = json['image'];
    isAdmin = json['isAdmin'];
    isDriver = json['isDriver'];
    verficationCode = json['verfication_code'];
    isVarified = json['is_varified'];
    fcmToken = json['fcm_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    driverId = json['driver_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['phone_number'] = phoneNumber;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['image'] = image;
    _data['isAdmin'] = isAdmin;
    _data['isDriver'] = isDriver;
    _data['verfication_code'] = verficationCode;
    _data['is_varified'] = isVarified;
    _data['fcm_token'] = fcmToken;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['driver_id'] = driverId;
    return _data;
  }
}