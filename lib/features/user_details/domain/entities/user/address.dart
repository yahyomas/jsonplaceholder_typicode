import 'package:equatable/equatable.dart';

class Address extends Equatable {
  late final String street;
  late final String suite;
  late final String city;
  late final String zipCode;

  Address(
      {required this.city,
      required this.street,
      required this.suite,
      required this.zipCode});

  @override
  List<Object?> get props => [city, suite, street, zipCode];
}
