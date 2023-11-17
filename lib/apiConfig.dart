import 'dart:math';

import 'package:apitest/constants.dart';
import 'package:apitest/models/photo.dart';
import 'package:apitest/models/posts.dart';
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

// Future<List<Posts>?> getPosts() async {
//   try {
//     var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.endPoint);
//     var response = await http.get(url);

//     if (response.statusCode == 200) {
//       List<Posts> posts = postsFromJson(response.body);
//       return posts;
//     } else {
//       print('error from fetching api ${response.statusCode}');
//       return null;
//     }
//   } catch (e) {
//     print('$e');
//   }
// }

Future<List<UserModel>?> getUsers() async {
  try {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.endPoint);
    var response = await http.get(url);

    if (response.statusCode == 201) {
      List<UserModel> usermodel = userModelFromJson(response.body);
      return usermodel;
    } else {
      print(' error from fetching Api ${response.statusCode}');
    }
  } catch (e) {
    print('$e');
  }
}
