import 'dart:convert';

import 'package:youtube_app/config/appConstants.dart';
import 'package:youtube_app/http/httpService.dart';
import 'package:youtube_app/model/packages.dart';
import 'package:http/http.dart' as http;

class PackagesService {
  HttpService httpService = HttpService.internal();

  Packages packages = Packages();

  Future<Packages> getPackagesData() async {
    Map<String, String> requestBody = <String, String>{
      'pid': APIConstants.packageId,
      'code': APIConstants.accessCode
    };

    final http.Response response = await httpService.postRequest(
        endPoint: APIConstants.getPackagesEndPoint, data: requestBody);

    if (response.statusCode == 200) {
      print("response body in Packages Service: ${response.body}");

      var json = jsonDecode(response.body);

      packages = Packages.fromJson(json);
    } else if (response.statusCode >= 400) {
      print(
          "Failed to get package with response code = ${response.statusCode}");
      return null;
    } else {
      throw Exception("Packages service: Failed to get package");
    }
//change this model to responce model
    return packages;
  }
}
