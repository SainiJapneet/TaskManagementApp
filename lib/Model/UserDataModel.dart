import 'dart:convert';

class UserDataModel {
  String name = "";
  String DOB = "";
  String? gender;
  String phoneNumber = "";
  String address = "";
  UserDataModel(
      {required String userName,
      required String userDOB,
      required String? userGender,
      required String userPhone,
      required String userAddress}) {
    name = userName;
    DOB = userDOB;
    gender = userGender;
    phoneNumber = userPhone;
    address = userAddress;
  }

  Map<String, dynamic> toJSON() => {
        'Name': name,
        'Date of Birth': DOB,
        'Gender': gender,
        'Phone Number': phoneNumber,
        'Address': address
      };

  static UserDataModel fromJSON(Map<String, dynamic> json) => UserDataModel(
      userName: json['Name'],
      userDOB: json['Date of Birth'],
      userGender: json['Gender'],
      userPhone: json['Phone Number'],
      userAddress: json['Address']);
}
