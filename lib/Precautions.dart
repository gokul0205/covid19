import 'package:covid19/stats_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Precautions extends StatelessWidget {
  var _scaffoldkey;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          key:_scaffoldkey,
          appBar: AppBar(
            backgroundColor:Colors.blueAccent.withOpacity(0.25),
            title:Padding(
              padding: const EdgeInsets.only(left:70),
              child: RichText(text:TextSpan(
                text: "Precautions",
                style:GoogleFonts.yanoneKaffeesatz(fontSize:30,fontWeight: FontWeight.bold,color: Color.fromRGBO(19, 84, 122, 1),) ,
              ),),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Entypo.chevron_thin_left,
                size: 24,
              ),
            ),
            ),

      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blueGrey,
                  Colors.white,
                  Colors.grey,
//                  Colors.redAccent,
////                Color.fromRGBO(128, 208, 199, 1),
////                Color.fromRGBO(19, 84, 122, 1),
//                  Colors.deepPurpleAccent,
                ],
              )),
        padding: EdgeInsets.all(20),
        child: ListView(

          children: <Widget>[

            Container(
              padding: EdgeInsets.only(left:20),
              width: double.infinity - 10,
              height: 140,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top:20,
                    child: SvgPicture.asset(
                      "assets/images/07.svg",
                      width: 100,
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 20,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text:
                          "Wash your hands often.\nAfter each time\n of interaction with\na external source",
                          style:
                          GoogleFonts.pangolin(fontSize: 20,color: Color.fromRGBO(19, 84, 122, 1),),
//                          TextStyle(
//                              fontSize: 30,
//                              color: Color.fromRGBO(19, 84, 122, 1),
//                              fontFamily: 'Natsuki'),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child:SvgPicture.asset("assets/images/flatten_curve.svg",
                width: 200,) ,
            ),
            Container(
              padding: EdgeInsets.only(left:20),
              width: double.infinity - 10,
              height: 200,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left:180,
                    top:0,
                    child: SvgPicture.asset(
                      "assets/images/08.svg",
                      width: 150,
                    ),
                  ),
                  Positioned(
//                    left: 100,
                    top: 20,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text:
                        "Stay away from Crowds.\nIsolate yourself.\nWear a mask\nwhen going outside",
                          style:
                          GoogleFonts.pangolin(fontSize: 20,color: Color.fromRGBO(19, 84, 122, 1),),
//                          TextStyle(
//                              fontSize: 30,
//                              color: Color.fromRGBO(19, 84, 122, 1),
//                              fontFamily: 'Natsuki'),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ),

//            SvgPicture.asset(
//              "assets/images/08.svg",
//              width: 100,
//            ),
//              SvgPicture.asset("assets/images/03.svg",width:100,),
//              SvgPicture.asset("assets/images/04.svg",width:100,),
          ],
        ),
      ),
    ));
  }
}
