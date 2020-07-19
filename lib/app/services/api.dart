import 'package:covid_tracker/app/services/api_key.dart';
import 'package:flutter/cupertino.dart';

enum Endpoint { cases, casesSuspected, casesConfirmed, deaths, recovered }

class API {
  API({@required this.apikey});
  final String apikey;
  factory API.sandbox() => API(apikey: Apikey.ncovSndboxKey);
  static final String Host = 'apigw.nubentos.com';
  static final int port = 443;
  static final basePath = 't/nubentos.com/ncovapi/1.0.0';

  Uri tokenUri() => Uri(
        scheme: 'https',
        host: Host,
        port: port,
        path: 'token',
        queryParameters: {'grant_type': 'client_credentials'},
      );

  Uri endpointUri(Endpoint endpoint) => Uri(
      scheme: 'https',
      host: Host,
      port: port,
      path: '$basePath/${_paths[endpoint]}');

  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.casesSuspected: 'cases/suspected',
    Endpoint.casesConfirmed: 'cases/confirmed',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered'
  };
}
