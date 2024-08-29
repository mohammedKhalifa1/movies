import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Curd {
  postData(String url, Map data) async {
    var request = await http.post(Uri.parse(url), body: data);
    if (request.statusCode == 200) {
      var requestBody = jsonDecode(request.body);
      return requestBody;
    } else {
      if (kDebugMode) {
        print("Catch_________________${request.statusCode}");
      }
    }
  }

  postFile(String url, Map data, File file) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    var leanth = await file.length();
    var strem = http.ByteStream(file.openRead());
    var multipartFile =
        await http.MultipartFile("file", strem, leanth, filename: file.path);
    request.files.add(multipartFile);
    data.forEach((key, value) {
      request.files[key] = value;
    });
    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);
    if (myRequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Catch____________________${myRequest.statusCode}");
    }
  }
}
