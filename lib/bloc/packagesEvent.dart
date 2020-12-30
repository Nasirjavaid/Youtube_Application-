import 'package:equatable/equatable.dart';

abstract class PackagesEvent extends Equatable {
  const PackagesEvent();
}

class FetchAllPackesEvent extends PackagesEvent {
  @override
  List<Object> get props => [];
}
