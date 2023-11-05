import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/features/HomeLayoutScreen1/data/models/SourcesResp.dart';

class ApiRecource {
  static Future<SourcesResp> Resource() async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "cd1b595b130f4542a460cd6e52756d7b"});

    Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    SourcesResp resp = SourcesResp.fromJson(jsonData);
    return resp;
  }
}
