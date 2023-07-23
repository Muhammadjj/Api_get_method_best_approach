import 'dart:convert';
import 'package:http/http.dart' as http;

import 'album_fake_api.dart';

extension RESTCodes on http.Response {
  bool get isSuccessful {
    return statusCode == 200;
  }

  bool get isCreated {
    return statusCode == 201;
  }
}

abstract class ApiProvider {
  String get baseUrl => 'https://jsonplaceholder.typicode.com/';
  String get apiUrl;
  
  fetch({String endPoint = ''}) async {
    var response = await http.get(Uri.parse(baseUrl + apiUrl + endPoint));
    if (response.isSuccessful) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  insert(Map<String, dynamic> map) async {
    var response =await http.post(Uri.parse(baseUrl + apiUrl), 
    body: jsonEncode(map));
    if (response.isCreated) {
      return true;
    } else {
      return false;
    }
  }
}

class AlbumApiProvider extends ApiProvider {
  @override
  String get apiUrl => 'Albums';
  
  Future<List<Album>> fetchAlbums() async {
    List mapList = await fetch();
    return mapList.map((map) => Album.fromMap(map)).toList();
  }



  Future<Album> fetchAlbum(String endPoint) async {
    Map<String, dynamic> map = await fetch(endPoint: endPoint);
    return Album.fromMap(map);
  }
}
