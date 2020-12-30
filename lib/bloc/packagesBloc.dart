import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_app/bloc/packagesEvent.dart';
import 'package:youtube_app/bloc/packagesState.dart';
import 'package:youtube_app/model/packages.dart';
import 'package:youtube_app/repository/packagesRpository.dart';



class PackagesBloc extends Bloc<PackagesEvent, PackagesState>{

  PackagesRepository _packagesRepository = PackagesRepository();
  

  @override
  PackagesState get initialState => PackagesInitialState();

  @override
  Stream<PackagesState> mapEventToState(PackagesEvent event) async* {
   

   if(event is FetchAllPackesEvent)
   {

    
     yield PackagesInProgressState();

        Packages packages = Packages();
        packages = await _packagesRepository.getPackagesData();

        

        yield PackagesInSuccessState(packages: packages);
   }
  }






}