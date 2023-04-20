import 'dart:convert';
import 'auth_service.dart';
import 'package:flutter_webapi_first_course/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

import '../models/journal.dart';

class JournalService {
  static const String url = 'http://192.168.0.224:3000/';
  static const String resource = 'journals/';

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getUrl() {
    return "$url$resource";
  }

  Future<bool> register(Journal journal, String token) async {
    String jsonJournal = json.encode(journal.toMap());
    http.Response response = await client.post(Uri.parse(getUrl()),
        headers: {
          'Content-type': 'application/json',
          "Authorization": "Bearer $token",
        },
        body: jsonJournal);
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<bool> edit(String id, Journal journal, String token ) async {
    String jsonJournal = json.encode(journal.toMap());
    http.Response response = await client.put(Uri.parse("${getUrl()}$id"),
        headers: {
          'Content-type': 'application/json',
          "Authorization": "Bearer $token",
        },
        body: jsonJournal);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<List<Journal>> getAll(
      {required String id, required String token}) async {
    http.Response response = await client.get(
        Uri.parse(("${url}users/$id/journals")),
        headers: {"Authorization": "Bearer $token"});

    if (response.statusCode != 200) {
      //Se token salvo localmente estiver expirado, deleta e volta pra tela de login
      if (response.body.contains("jwt expired")) {
        AuthService auth = AuthService();
        auth.deleteUserInfos();
      }
      throw Exception();
    }

    List<Journal> list = [];
    List<dynamic> listDynamic = json.decode(response.body);
    for (var jsonMap in listDynamic) {
      list.add(Journal.fromMap(jsonMap));
    }

    return list;
  }

  Future<bool> delete(String id, String token) async {
    http.Response response = await http.delete(Uri.parse("${getUrl()}$id"), headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
