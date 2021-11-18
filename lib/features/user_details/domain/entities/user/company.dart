import 'package:equatable/equatable.dart';

class WorkingCompany extends Equatable {
  late final String name;
  late final String catchPhrase;
  late final String bs;

  WorkingCompany(
      {required this.name, required this.bs, required this.catchPhrase});

  @override
  List<Object?> get props => [name, bs, catchPhrase];
}
