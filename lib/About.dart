import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Dashboard.dart';

class About extends StatelessWidget {
  var _scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(
                  left: 30,
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
                    Colors.red.withOpacity(0.90),
//                        Color.fromRGBO(128, 208, 199, 1).withOpacity(0.50),
//                  Color.fromRGBO(102, 126, 234, 1),

                          Colors.yellow.withOpacity(0.50),
//                        Colors.orangeAccent.withOpacity(0.90),
//                        Colors.red.withOpacity(0.90),

                  ],
                )),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
//                      _scaffoldKey.currentState.openDrawer();
                        Navigator.of(context).pop();
                      },
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Entypo.chevron_thin_left,
                          size: 24,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 50,
                            child: SvgPicture.asset(
                              "assets/images/doctors.svg",
                              width: 200,

                              fit: BoxFit.fitWidth,
//                          alignment: Alignment.topCenter,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Center(
                  child: Text(
                    "Thank you doctors!",
                    style: GoogleFonts.yanoneKaffeesatz(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.red,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "About:",
                    style: GoogleFonts.abel(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child:RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:"This app was created to track the outbreak of",
                          style: GoogleFonts.abel(

                            fontSize: 25,
                            color: Colors.grey,
                          ),
                        ),
                        TextSpan(
                          text:" COVID ",
                          style: GoogleFonts.abel(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.blueGrey,
                          ),
                        ),
                        TextSpan(
                          text:"Virus. This Data available is RealTime and not a static data",
                          style: GoogleFonts.abel(

                            fontSize: 25,
                            color: Colors.grey,
                          ),
                        ),
                        TextSpan(
                          text:"\n For doubts or queries reach me at @gokul_0205 at telegram",
                          style: GoogleFonts.abel(

                            fontSize: 25,
                            color: Colors.grey,
                          ),

                        ),
                      ]
                    ),
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
