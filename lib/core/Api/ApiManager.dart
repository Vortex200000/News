import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/core/Components/constants.dart';
import 'package:news/features/HomeLayoutScreen1/data/models/NewsResponse.dart';
import 'package:news/features/HomeLayoutScreen1/data/models/SourcesResp.dart';

class ApiRecource {
  static Future<SourcesResp> Resource(String catid) async {
    Uri url = Uri.https(BASE_URL, "/v2/top-headlines/sources",
        {"apiKey": API_KEY, "category": catid});

    Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    SourcesResp resp = SourcesResp.fromJson(jsonData);
    return resp;
  }

  static Future<NewsResponse> getNewsData(String sourceId, String Q) async {
    Uri url = Uri.https(BASE_URL, "/v2/everything",
        {"apiKey": API_KEY, "sources": sourceId, "q": Q}); //
    Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    NewsResponse resp = NewsResponse.fromJson(jsonData);
    return resp;
  }
}
