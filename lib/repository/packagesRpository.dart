import 'package:youtube_app/model/packages.dart';
import 'package:youtube_app/service/packagesService.dart';



class PackagesRepository {
  
  PackagesService packagesService = PackagesService();
  Packages packages = Packages();
  
  Future<Packages> getPackagesData() async {
    //custom delay
    // await Future.delayed(Duration(seconds: 1));

    packages = await packagesService.getPackagesData();
    

    print("Packages data in Repository ${packages.songoftheday[0].keyword}");

    // creating packages based on same 'MainCatID'
    List<List<Songs>> listsOfSongs = [];

    // for (int i = 0; i < packages.songs.length; i++) {

    List<Songs> songsList = [];
    
   

    List cat_id = [];
    for (int a = 0; a < packages.songs.length; a++) {
      cat_id.add(packages.songs[a].mainCatID);
      
      print("In loop ${cat_id[a]  } " );
    }

    Set newSet = cat_id.toSet();
    List  catIdListInString = newSet.toList();

    for (int j = 0; j < catIdListInString.length; j++) {

      for (int i = 0; i < packages.songs.length; i++) {
      if (packages.songs[i].mainCatID == catIdListInString[j]) {

//  String streamUrl = await extractStreamUrl(packages.songs[i].description);
//  String audioUrl = await extractAudioUrl(packages.songs[i].description);
//  packages.songs[i].extractedVideoUrl =streamUrl;

//  packages.songs[i].extractedAudioUrl=audioUrl;
        songsList.add(packages.songs[i]);
      }

    
      
    }
      listsOfSongs.add(songsList);
       songsList=[];
     
    
    }
   
   
    packages.listsOfSongs = listsOfSongs;

    // }

    print("2D array size ${listsOfSongs.length}");

    if (packages != null) {
      return packages;
    }
    return null;
  }








}
