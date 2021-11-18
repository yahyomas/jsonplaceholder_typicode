import 'package:demo_app_bloc/features/user_details/domain/entities/user/address.dart';
import 'package:demo_app_bloc/features/user_details/domain/entities/user/company.dart';
import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  late final String userName;
  late final int id;
  late final String name;
  late final String mail;
  late final String phone;
  late final String website;
  late final WorkingCompany workingCompany;
  late final Address address;

  UserInfo(
      {required this.address,
      required this.workingCompany,
      required this.name,
      required this.userName,
      required this.phone,
      required this.mail,
      required this.website,
      required this.id});

  @override
  List<Object?> get props =>
      [address, workingCompany, name, userName, phone, mail, website, id];
}
