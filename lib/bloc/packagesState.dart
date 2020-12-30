import 'package:youtube_app/model/packages.dart';

abstract class PackagesState {
  const PackagesState();
}

class PackagesInitialState extends PackagesState {}

class PackagesInProgressState extends PackagesState {}

class PackagesInSuccessState extends PackagesState {
  final Packages packages;
PackagesInSuccessState({this.packages});

}

class PackagesInFailedState extends PackagesState {
  final String errorMessage;
  PackagesInFailedState({this.errorMessage});
}
