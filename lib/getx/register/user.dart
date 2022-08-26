



import 'dart:convert';

class Users {

  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  String?phone;


  Users({
   this.name,
   this.password,
   this.email,
   this.passwordConfirmation,
    this.phone,
});

}
// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);


// List<Userm> userFromJson(String str) => List<Userm>.from(json.decode(str).map((x) => Userm.fromJson(x)));
//
// String userToJson(List<Userm> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Users {
//   Userm({
//     required this.token,
//     required this.customer,
//     required this.user, required password, required String email,
//   });
//
//   String token;
//   Customer customer;
//   UserClass user;
//
//   factory Users.fromJson(Map<String, dynamic> json) => Users(
//     token: json["token"],
//     customer: Customer.fromJson(json["customer"]),
//     user: UserClass.fromJson(json["user"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "token": token,
//     "customer": customer.toJson(),
//     "user": user.toJson(),
//   };
// }
//
// class Customer {
//   Customer({
//     required this.customerId,
//     required this.id,
//     required this.blocked,
//     required  this.createdAt,
//     required  this.updatedAt,
//   });
//
//   int customerId;
//   int id;
//   dynamic blocked;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory Customer.fromJson(Map<String, dynamic> json) => Customer(
//     customerId: json["customer_id"],
//     id: json["id"],
//     blocked: json["blocked"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "customer_id": customerId,
//     "id": id,
//     "blocked": blocked,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
//
// class UserClass {
//   UserClass({
//     required  this.id,
//     required   this.name,
//     required  this.phoneNumber,
//     required  this.email,
//     required  this.emailVerifiedAt,
//     required  this.isAdmin,
//     required  this.isDriver,
//     required  this.verficationCode,
//     required   this.isVarified,
//     required   this.createdAt,
//     required  this.updatedAt,
//   });
//
//   int id;
//   String name;
//   String phoneNumber;
//   String email;
//   DateTime emailVerifiedAt;
//   int isAdmin;
//   int isDriver;
//   String verficationCode;
//   String isVarified;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
//     id: json["id"],
//     name: json["name"],
//     phoneNumber: json["phone_number"],
//     email: json["email"],
//     emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
//     isAdmin: json["isAdmin"],
//     isDriver: json["isDriver"],
//     verficationCode: json["verfication_code"],
//     isVarified: json["is_varified"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "phone_number": phoneNumber,
//     "email": email,
//     "email_verified_at": emailVerifiedAt.toIso8601String(),
//     "isAdmin": isAdmin,
//     "isDriver": isDriver,
//     "verfication_code": verficationCode,
//     "is_varified": isVarified,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
