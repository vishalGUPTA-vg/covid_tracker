import 'package:covid_tracker/app/services/api.dart';
import 'package:covid_tracker/app/services/api_key.dart';
import 'package:covid_tracker/app/services/api_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Covid Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _accesstoken = "";
  int _cases;
  int _suspectedcases;
  int _casesConfirmed, _deaths, _recovered;

  void _updateAccessToken() async {
    final apiservices = APIServices(API.sandbox());
    final accestoken = await apiservices.getAccessToken();
    final cases = await apiservices.getEndpointData(
        accessToken: accestoken, endpoint: Endpoint.cases);
    final suspectedcases = await apiservices.getEndpointData(
        accessToken: accestoken, endpoint: Endpoint.casesSuspected);
    final casesConfirmed = await apiservices.getEndpointData(
        accessToken: accestoken, endpoint: Endpoint.casesConfirmed);
    final deaths = await apiservices.getEndpointData(
        accessToken: accestoken, endpoint: Endpoint.deaths);
    final recovered = await apiservices.getEndpointData(
        accessToken: accestoken, endpoint: Endpoint.recovered);
    setState(() {
      _accesstoken = accestoken;
      _cases = cases;
      _suspectedcases = suspectedcases;
      _casesConfirmed = casesConfirmed;
      _deaths = deaths;
      _recovered = recovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.title,
        )),
        backgroundColor: Colors.grey[800],
      ),
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.grey[800],
                      child: InkWell(
                          onTap: () {
                            _updateAccessToken();
                          },
                          child: Container(
                            width: 300,
                            height: 70,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Cases",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.yellow[400]),
                                  ),
                                ),
                                if (_cases != null)
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "  ${_cases} ",
                                            style: TextStyle(
                                                fontSize: 31,
                                                color: Colors.yellow[400]),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.grey[800],
                      child: InkWell(
                          onTap: () {
                            _updateAccessToken();
                          },
                          child: Container(
                            width: 300,
                            height: 70,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Suspected",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.yellow[800]),
                                  ),
                                ),
                                if (_cases != null)
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "  ${_suspectedcases} ",
                                            style: TextStyle(
                                                fontSize: 31,
                                                color: Colors.yellow[800]),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.grey[800],
                      child: InkWell(
                          onTap: () {
                            _updateAccessToken();
                          },
                          child: Container(
                            width: 300,
                            height: 70,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Confirmed",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.red[400]),
                                  ),
                                ),
                                if (_cases != null)
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "  ${_casesConfirmed} ",
                                            style: TextStyle(
                                                fontSize: 31,
                                                color: Colors.red[400]),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.grey[800],
                      child: InkWell(
                          onTap: () {
                            _updateAccessToken();
                          },
                          child: Container(
                            width: 300,
                            height: 70,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Deaths",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.red[900]),
                                  ),
                                ),
                                if (_cases != null)
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "  ${_deaths} ",
                                            style: TextStyle(
                                                fontSize: 31,
                                                color: Colors.red[900]),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.grey[800],
                      child: InkWell(
                          onTap: () {
                            _updateAccessToken();
                          },
                          child: Container(
                            width: 300,
                            height: 70,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Recoverd",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.green[100]),
                                  ),
                                ),
                                if (_cases != null)
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "  ${_recovered} ",
                                            style: TextStyle(
                                                fontSize: 31,
                                                color: Colors.green[100]),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateAccessToken,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
