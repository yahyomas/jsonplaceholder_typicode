import 'package:demo_app_bloc/features/user_details/domain/entities/user/address.dart';
import 'package:demo_app_bloc/features/user_details/domain/entities/user/company.dart';
import 'package:demo_app_bloc/features/user_details/domain/entities/user/user_info.dart';

class UserInfoModel extends UserInfo {
  UserInfoModel({
    required int id,
    required String name,
    required String username,
    required String email,
    required Address address,
    required String phone,
    required String website,
    required WorkingCompany company,
  }) : super(
            address: address,
            mail: email,
            website: website,
            id: id,
            name: name,
            userName: username,
            workingCompany: company,
            phone: phone);

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: (json['address'] != null
          ? AddressModel.fromJson(json['address'])
          : null)!,
      phone: json['phone'],
      website: json['website'],
      company: (json['company'] != null
          ? CompanyModel.fromJson(json['company'])
          : null)!,
    );
  }
}

class CompanyModel extends WorkingCompany {
  CompanyModel({
    required String name,
    required String catchPhrase,
    required String bs,
  }) : super(name: name, catchPhrase: catchPhrase, bs: bs);

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}

class AddressModel extends Address {
  AddressModel({
    required String street,
    required String suite,
    required String city,
    required String zipcode,
  }) : super(street: street, suite: street, city: city, zipCode: zipcode);

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
    );
  }
}
