import 'package:covid19/Precautions.dart';
import 'package:covid19/Stats_by_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'About.dart';
import 'StatsClass.dart';
import 'stats_card.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//  AnimationController colourController;
//  Animation<Color> animationOne;
//  Animation<Color> animationTwo;
//  @override
//  void initState() {
//    super.initState();
//    colourController = AnimationController(
//      duration: Duration(seconds: 2),
//      vsync: this,
//    );
//    animationOne = ColorTween(begin: Colors.grey, end: Colors.grey[100])
//        .animate(colourController);
//    animationTwo = ColorTween(begin: Colors.grey[100], end: Colors.grey)
//        .animate(colourController);
//    colourController.forward();
//  }

  Future<Stats> liveStats() async {
    var data = await http.get("https://api.covid19api.com/summary");
    var jsonData = json.decode(data.body);
    var global = jsonData["Global"];
    Stats live = Stats(
        global["NewConfirmed"].toString(),
        global["TotalConfirmed"].toString(),
        global["NewDeaths"].toString(),
        global["TotalDeaths"].toString(),
        global["NewRecovered"].toString(),
        global["TotalRecovered"].toString());
    return live;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      initialRoute: '/',
//      routes: {
//        // When navigating to the "/" route, build the FirstScreen widget.
//        '/': (context) => Dashboard(),
//        '/Precautions': (context) => Precautions(),
//        // When navigating to the "/second" route, build the SecondScreen widget.
//        '/About': (context) => About(),
//      },
      home: Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
//              Expanded(
//                flex: 1,
//                child: DrawerHeader(
//                  decoration: BoxDecoration(
//                    color: Colors.orangeAccent,
//                  ),
//                  child: Text("Menu"),
//                ),
//              ),
                Expanded(
                  flex: 2,
                  child: ListView(children: [
                    ListTile(
                      title: Text("Home",style: TextStyle(color:Colors.redAccent),),
                      onTap: () {
//                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      title: Text("View Number of cases by States",style: TextStyle(color:Colors.redAccent),),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StatsByState()),
                        );
                      },
                    ),

                    ListTile(
                      title: Text("Precautions",style: TextStyle(color:Colors.redAccent),),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Precautions()),
                        );
                      },
                    ),
                    ListTile(
                      title: Text("About",style: TextStyle(color:Colors.redAccent),),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => About()),
                        );
                      },
                    ),

//                  ListTile(
//                    title: Text("Home"),
//                    onTap: () {
//                      Navigator.of(context).pop();
//                    },
//                  ),
                  ]),
                )
              ],
            ),
          ),
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 40,
                      top: 50,
                      right: 15,
                    ),
                    height: 320,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(128, 208, 199, 1),
                        Color.fromRGBO(19, 84, 122, 1),
                      ],
                    )),
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState.openDrawer();
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Entypo.chevron_thin_down,
                              size: 24,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                left: 80,
                                top: -25,
                                child: SvgPicture.asset(
                                  "assets/images/coronavirus_doctor.svg",
                                  width: 370,

                                  fit: BoxFit.fitWidth,
//                          alignment: Alignment.topCenter,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                child: SvgPicture.asset(
                                  "assets/images/fight_covid.svg",
                                  width: 160,

                                  fit: BoxFit.fitWidth,
//                          alignment: Alignment.topCenter,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10, top: 20, right: 0, bottom: 40),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.08),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text:TextSpan(
                          children: [
                            TextSpan(text:"  Overall ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20 ),),
                            TextSpan(text:"Statistics",style: TextStyle(color: Colors.black,fontSize: 20),),
                          ]
                        )
                      ),
                      FutureBuilder(
                        future: liveStats(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return ShaderMask(
                                shaderCallback: (rect) {
                                  return LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromRGBO(19, 84, 122, 1)
                                          .withOpacity(0.5),
                                      Colors.grey.shade100.withOpacity(0.5)
                                    ],
                                  ).createShader(
                                      Rect.fromLTRB(0, 0, rect.width, rect.height));
                                },
                                child: Wrap(
                                  children: <Widget>[
                                    Stats_card(context, "Confirmed Cases", "",
                                        "assets/images/notification_blue.svg"),
                                    Stats_card(context, "Total Deaths", "",
                                        "assets/images/notification_darkred.svg"),
                                    Stats_card(context, "Total Recovered", "",
                                        "assets/images/notification_green.svg"),
                                    Stats_card(context, "New Cases", "",
                                        "assets/images/notification_red.svg"),
                                  ],
                                ),
                              );
                            case ConnectionState.waiting:
                              return ShaderMask(
                                shaderCallback: (rect) {
                                  return LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromRGBO(19, 84, 122, 1)
                                          .withOpacity(0.5),
                                      Colors.orangeAccent.withOpacity(0.5)
                                    ],
                                  ).createShader(
                                      Rect.fromLTRB(0, 0, rect.width, rect.height));
                                },
                                child: Wrap(
                                  children: <Widget>[
                                    Stats_card(context, "Confirmed Cases", "",
                                        "assets/images/notification_blue.svg"),
                                    Stats_card(context, "Total Deaths", "",
                                        "assets/images/notification_darkred.svg"),
                                    Stats_card(context, "Total Recovered", "",
                                        "assets/images/notification_green.svg"),
                                    Stats_card(context, "New Cases", "",
                                        "assets/images/notification_red.svg"),
                                  ],
                                ),
                              );
                            default:
                              if (snapshot.hasError)
                                return ShaderMask(
                                  shaderCallback: (rect) {
                                    return LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color.fromRGBO(19, 84, 122, 1)
                                            .withOpacity(0.5),
                                        Colors.red.withOpacity(0.5)
                                      ],
                                    ).createShader(Rect.fromLTRB(
                                        0, 0, rect.width, rect.height));
                                  },
                                  child: Wrap(
                                    children: <Widget>[
                                      Stats_card(context, "Confirmed Cases", "",
                                          "assets/images/notification_blue.svg"),
                                      Stats_card(context, "Total Deaths", "",
                                          "assets/images/notification_darkred.svg"),
                                      Stats_card(context, "Total Recovered", "",
                                          "assets/images/notification_green.svg"),
                                      Stats_card(context, "New Cases", "",
                                          "assets/images/notification_red.svg"),
                                    ],
                                  ),
                                );
                              else
                                return Wrap(
                                  children: <Widget>[
                                    Stats_card(
                                        context,
                                        "Confirmed Cases",
                                        snapshot.data.totalConfirmed,
                                        "assets/images/notification_blue.svg"),
                                    Stats_card(
                                        context,
                                        "Total Deaths",
                                        snapshot.data.totalDeaths,
                                        "assets/images/notification_darkred.svg"),
                                    Stats_card(
                                        context,
                                        "Total Recovered",
                                        snapshot.data.totalRecovered,
                                        "assets/images/notification_green.svg"),
                                    Stats_card(
                                        context,
                                        "New Cases",
                                        snapshot.data.newConfirmed,
                                        "assets/images/notification_red.svg"),
                                  ],
                                );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
