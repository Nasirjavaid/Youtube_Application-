class Packages {
  List<Headers> headers;
 // List<Null> wallpaers;
  List<Songoftheday> songoftheday;
  List<Songs> songs;
  List<List<Songs>> listsOfSongs; 
  List<Channellst> channellst;
  //List<Null> youtubekeys;
  List<Firebaseaccountinfo> firebaseaccountinfo;
  String oNLINEMP3;

  Packages(
      {this.headers,
    //  this.wallpaers,
      this.songoftheday,
      this.songs,
      this.channellst,
     // this.youtubekeys,
      this.firebaseaccountinfo,
      this.oNLINEMP3,
      this.listsOfSongs
      });

  Packages.fromJson(Map<String, dynamic> json) {
    if (json['headers'] != null) {
      headers = new List<Headers>();
      json['headers'].forEach((v) {
        headers.add(new Headers.fromJson(v));
      });
    }
    // if (json['wallpaers'] != null) {
    //   wallpaers = new List<Null>();
    //   json['wallpaers'].forEach((v) {
    //     wallpaers.add(new Null.fromJson(v));
    //   });
    // }
    if (json['songoftheday'] != null) {
      songoftheday = new List<Songoftheday>();
      json['songoftheday'].forEach((v) {
        songoftheday.add(new Songoftheday.fromJson(v));
      });
    }
    if (json['songs'] != null) {
      songs = new List<Songs>();
      json['songs'].forEach((v) {
        songs.add(new Songs.fromJson(v));
      });
    }
    if (json['channellst'] != null) {
      channellst = new List<Channellst>();
      json['channellst'].forEach((v) {
        channellst.add(new Channellst.fromJson(v));
      });
    }
    // if (json['youtubekeys'] != null) {
    //   youtubekeys = new List<Null>();
    //   json['youtubekeys'].forEach((v) {
    //     youtubekeys.add(new Null.fromJson(v));
    //   });
    // }
    if (json['firebaseaccountinfo'] != null) {
      firebaseaccountinfo = new List<Firebaseaccountinfo>();
      json['firebaseaccountinfo'].forEach((v) {
        firebaseaccountinfo.add(new Firebaseaccountinfo.fromJson(v));
      });
    }
    oNLINEMP3 = json['ONLINE_MP3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.headers != null) {
      data['headers'] = this.headers.map((v) => v.toJson()).toList();
    }
    // if (this.wallpaers != null) {
    //   data['wallpaers'] = this.wallpaers.map((v) => v.toJson()).toList();
    // }
    if (this.songoftheday != null) {
      data['songoftheday'] = this.songoftheday.map((v) => v.toJson()).toList();
    }
    if (this.songs != null) {
      data['songs'] = this.songs.map((v) => v.toJson()).toList();
    }
    if (this.channellst != null) {
      data['channellst'] = this.channellst.map((v) => v.toJson()).toList();
    }
    // if (this.youtubekeys != null) {
    //   data['youtubekeys'] = this.youtubekeys.map((v) => v.toJson()).toList();
    // }
    if (this.firebaseaccountinfo != null) {
      data['firebaseaccountinfo'] =
          this.firebaseaccountinfo.map((v) => v.toJson()).toList();
    }
    data['ONLINE_MP3'] = this.oNLINEMP3;
    return data;
  }
}

class Headers {
  int iD;
  int headerID;
  int packageID;
  String redirectionApp;
  int redirectionPanelID;
  int sortorder;
  String headImage;
  String status;
  String date;
  int addedBy;

  Headers(
      {this.iD,
      this.headerID,
      this.packageID,
      this.redirectionApp,
      this.redirectionPanelID,
      this.sortorder,
      this.headImage,
      this.status,
      this.date,
      this.addedBy});

  Headers.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    headerID = json['HeaderID'];
    packageID = json['PackageID'];
    redirectionApp = json['RedirectionApp'];
    redirectionPanelID = json['RedirectionPanelID'];
    sortorder = json['Sortorder'];
    headImage = json['HeadImage'];
    status = json['Status'];
    date = json['Date'];
    addedBy = json['AddedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['HeaderID'] = this.headerID;
    data['PackageID'] = this.packageID;
    data['RedirectionApp'] = this.redirectionApp;
    data['RedirectionPanelID'] = this.redirectionPanelID;
    data['Sortorder'] = this.sortorder;
    data['HeadImage'] = this.headImage;
    data['Status'] = this.status;
    data['Date'] = this.date;
    data['AddedBy'] = this.addedBy;
    return data;
  }
}

class Songoftheday {
  int iD;
  int pid;
  String keyword;
  String title;
  String status;
  String date;
  int addedBy;

  Songoftheday(
      {this.iD,
      this.pid,
      this.keyword,
      this.title,
      this.status,
      this.date,
      this.addedBy});

  Songoftheday.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    pid = json['Pid'];
    keyword = json['keyword'];
    title = json['Title'];
    status = json['Status'];
    date = json['Date'];
    addedBy = json['AddedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Pid'] = this.pid;
    data['keyword'] = this.keyword;
    data['Title'] = this.title;
    data['Status'] = this.status;
    data['Date'] = this.date;
    data['AddedBy'] = this.addedBy;
    return data;
  }
}

class Songs {
  int mainCatID;
  String mainCatName;
  String mainCatDescription;
  String mainCatImage;
  int maincatsort;
  String packageName;
  bool packageIsAddActive;
  int packageAddlimit;
  String packageDescription;
  bool packageStatus;
  bool packageIsAddmob;
  bool packageIsStartapp;
  int iD;
  int packageID;
  String title;
  String keyword;
  String webview;
  bool isplaylist;
  String playlistcode;
  bool isRedirection;
  String redirectionApp;
  int sortorder;
  String image;
  bool isLimit;
  int limitCount;
  String description;
  bool status;
  String date;
  int mCID;
  int subcatSortorder;
  String extractedVideoUrl;
  String extractedAudioUrl;

  Songs(
      {this.mainCatID,
      this.mainCatName,
      this.mainCatDescription,
      this.mainCatImage,
      this.maincatsort,
      this.packageName,
      this.packageIsAddActive,
      this.packageAddlimit,
      this.packageDescription,
      this.packageStatus,
      this.packageIsAddmob,
      this.packageIsStartapp,
      this.iD,
      this.packageID,
      this.title,
      this.keyword,
      this.webview,
      this.isplaylist,
      this.playlistcode,
      this.isRedirection,
      this.redirectionApp,
      this.sortorder,
      this.image,
      this.isLimit,
      this.limitCount,
      this.description,
      this.status,
      this.date,
      this.mCID,
      this.subcatSortorder,this.extractedVideoUrl,this.extractedAudioUrl});

  Songs.fromJson(Map<String, dynamic> json) {
    mainCatID = json['MainCatID'];
    mainCatName = json['MainCatName'];
    mainCatDescription = json['MainCatDescription'];
    mainCatImage = json['MainCatImage'];
    maincatsort = json['Maincatsort'];
    packageName = json['PackageName'];
    packageIsAddActive = json['PackageIsAddActive'];
    packageAddlimit = json['PackageAddlimit'];
    packageDescription = json['PackageDescription'];
    packageStatus = json['PackageStatus'];
    packageIsAddmob = json['PackageIsAddmob'];
    packageIsStartapp = json['PackageIsStartapp'];
    iD = json['ID'];
    packageID = json['PackageID'];
    title = json['Title'];
    keyword = json['Keyword'];
    webview = json['webview'];
    isplaylist = json['Isplaylist'];
    playlistcode = json['Playlistcode'];
    isRedirection = json['IsRedirection'];
    redirectionApp = json['RedirectionApp'];
    sortorder = json['Sortorder'];
    image = json['Image'];
    isLimit = json['IsLimit'];
    limitCount = json['LimitCount'];
    description = json['Description'];
    status = json['Status'];
    date = json['Date'];
    mCID = json['MCID'];
    subcatSortorder = json['subcatSortorder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MainCatID'] = this.mainCatID;
    data['MainCatName'] = this.mainCatName;
    data['MainCatDescription'] = this.mainCatDescription;
    data['MainCatImage'] = this.mainCatImage;
    data['Maincatsort'] = this.maincatsort;
    data['PackageName'] = this.packageName;
    data['PackageIsAddActive'] = this.packageIsAddActive;
    data['PackageAddlimit'] = this.packageAddlimit;
    data['PackageDescription'] = this.packageDescription;
    data['PackageStatus'] = this.packageStatus;
    data['PackageIsAddmob'] = this.packageIsAddmob;
    data['PackageIsStartapp'] = this.packageIsStartapp;
    data['ID'] = this.iD;
    data['PackageID'] = this.packageID;
    data['Title'] = this.title;
    data['Keyword'] = this.keyword;
    data['webview'] = this.webview;
    data['Isplaylist'] = this.isplaylist;
    data['Playlistcode'] = this.playlistcode;
    data['IsRedirection'] = this.isRedirection;
    data['RedirectionApp'] = this.redirectionApp;
    data['Sortorder'] = this.sortorder;
    data['Image'] = this.image;
    data['IsLimit'] = this.isLimit;
    data['LimitCount'] = this.limitCount;
    data['Description'] = this.description;
    data['Status'] = this.status;
    data['Date'] = this.date;
    data['MCID'] = this.mCID;
    data['subcatSortorder'] = this.subcatSortorder;
    return data;
  }
}

class Channellst {
  int iD;
  String channel;
  String channelID;
  String date;
  int addedBy;

  Channellst({this.iD, this.channel, this.channelID, this.date, this.addedBy});

  Channellst.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    channel = json['Channel'];
    channelID = json['ChannelID'];
    date = json['Date'];
    addedBy = json['AddedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Channel'] = this.channel;
    data['ChannelID'] = this.channelID;
    data['Date'] = this.date;
    data['AddedBy'] = this.addedBy;
    return data;
  }
}

class Firebaseaccountinfo {
  int iD;
  String packageName;
  String appName;
  Null image;
  Null isAddActive;
  Null addlimit;
  Null description;
  Null status;
  Null date;
  Null isAddmob;
  Null isStartapp;
  String notificationTopic;
  Null dateformat;
  Null aPIKEY;
  String topickey;
  String domain;
  String firebaseKey;
  String firebaseSenderid;
  Null islive;

  Firebaseaccountinfo(
      {this.iD,
      this.packageName,
      this.appName,
      this.image,
      this.isAddActive,
      this.addlimit,
      this.description,
      this.status,
      this.date,
      this.isAddmob,
      this.isStartapp,
      this.notificationTopic,
      this.dateformat,
      this.aPIKEY,
      this.topickey,
      this.domain,
      this.firebaseKey,
      this.firebaseSenderid,
      this.islive});

  Firebaseaccountinfo.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    packageName = json['PackageName'];
    appName = json['AppName'];
    image = json['Image'];
    isAddActive = json['IsAddActive'];
    addlimit = json['Addlimit'];
    description = json['Description'];
    status = json['Status'];
    date = json['Date'];
    isAddmob = json['IsAddmob'];
    isStartapp = json['IsStartapp'];
    notificationTopic = json['NotificationTopic'];
    dateformat = json['dateformat'];
    aPIKEY = json['APIKEY'];
    topickey = json['topickey'];
    domain = json['domain'];
    firebaseKey = json['firebase_key'];
    firebaseSenderid = json['firebase_senderid'];
    islive = json['Islive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['PackageName'] = this.packageName;
    data['AppName'] = this.appName;
    data['Image'] = this.image;
    data['IsAddActive'] = this.isAddActive;
    data['Addlimit'] = this.addlimit;
    data['Description'] = this.description;
    data['Status'] = this.status;
    data['Date'] = this.date;
    data['IsAddmob'] = this.isAddmob;
    data['IsStartapp'] = this.isStartapp;
    data['NotificationTopic'] = this.notificationTopic;
    data['dateformat'] = this.dateformat;
    data['APIKEY'] = this.aPIKEY;
    data['topickey'] = this.topickey;
    data['domain'] = this.domain;
    data['firebase_key'] = this.firebaseKey;
    data['firebase_senderid'] = this.firebaseSenderid;
    data['Islive'] = this.islive;
    return data;
  }
}