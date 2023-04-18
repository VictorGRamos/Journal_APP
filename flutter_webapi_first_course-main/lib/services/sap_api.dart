import 'dart:convert';
import 'package:flutter_webapi_first_course/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

class SapService{
  static const String sapconection = 'http://sap-qas-ecc01.ferroeste.com.br:8080/rest_ferroeste?sap-client=400';

  //Corpo da requisição, constante para teste
  static const String jsonString = '{"CNPJ_CPF": "64851538000192","COD_CLIENTE": ""}'; 
  List<int> bodyBytes = utf8.encode(jsonString);

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);


  String getSapConection() {
    return sapconection;
  }

  registerSap() {
    client.post(Uri.parse(getSapConection()),
        headers: {"BUSINESS_OBJECT": 'APICADASTRO'},
        body: bodyBytes); 
  }

}