

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final List<dynamic> props;
  Failure({required this.props});
}

class ServerFailure extends  Failure{
  ServerFailure({required List<dynamic> props,}):super(props: props);

  @override
  List get props => [props];

}