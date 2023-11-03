import 'dart:math';

import 'package:apitest/constants.dart';
import 'package:apitest/models/photo.dart';
//import 'package:apitest/models/album.dart';
import 'package:apitest/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:math';
import 'dart:convert';
import 'dart:core';
import 'dart:developer';
//import 'dart:developer';

// Future<http.Response> fetchAlbum() async {
// return http.get(Uri.parse('https: jsonplaceholder.typicode.com/albums/1'));
// }

// Future<Album> fetchAlbum() async {
//   final response = await http
//       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

//   if (response.statusCode == 200) {
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('failed to load album');
//   }
// }

class ApiConfig {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.endPoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<UserModel> model = userModelFromJson(response.body);
        return model;
      } else {
        print('Error message from fetching data ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('$e');
    }
  }
}
