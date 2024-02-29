// ignore_for_file: file_names

class UserModel {
  int? id;

  String? name;

  String? token;

  String? email;

  String? displayName;

  String? address;
  String? phoneNumber;

  UserModel(
      {this.id,
      this.name,
      this.token,
      this.email,
      this.displayName,
      this.address,
      this.phoneNumber});

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        token: json["token"],
        email: json["email"],
        displayName: json["displayName"],
        address: json["address"],
        phoneNumber: json['phoneNumber'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "token": token,
        "email": email,
        "displayName": displayName,
        "address": address,
        "phoneNumber": phoneNumber,
      };
}
