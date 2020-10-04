import 'dart:convert';
import 'package:covid19/stat_single_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsByState extends StatefulWidget {
  @override
  _StatsByState createState() => _StatsByState();
}

class _StatsByState extends State<StatsByState> {
  String dropdownValue = 'Tamil Nadu';
  Future<String> liveStats() async {
    String cases;
    var data = await http.get(
        "https://script.googleusercontent.com/macros/echo?user_content_key=8vzWT4N8KlUQs0hR6cAetXOs8oWv-xk3e2VY1xa41NzCegYqsXRmhetP4JfC-mhfpFQJswSjVCy-22zAu5FA_dzDoWAucdvUm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnKXFvsR88vL4WiBr168omFadgngDnj25DLpEvLRaiIpzZr1NvbW-Bo38vshdDBv10tpytj_A4aoE&lib=Mm1FD1HVuydJN5yAB3dc_e8h00DPSBbB3");
    var jsonData = json.decode(data.body);
    cases = jsonData[dropdownValue].toString();
    return cases;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.25),
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: RichText(
            text: TextSpan(
              text: "Statewise Covid Cases",
              style: GoogleFonts.yanoneKaffeesatz(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
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
            Colors.redAccent,
//                Color.fromRGBO(128, 208, 199, 1),
//                Color.fromRGBO(19, 84, 122, 1),
            Colors.deepPurpleAccent,
          ],
        )),
        child: ListView(
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/woman_with_mask.svg",
              width: 300,
            ),
            Center(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Select a State in india to find the number of cases",
                    style: GoogleFonts.yanoneKaffeesatz(
                      fontSize: 25,
                      color: Colors.white,
                    )),
              ])),
            ),
            Center(
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(
                  Ionicons.ios_arrow_down,
                  color: Colors.white,
                ),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>[
                  'Andaman and Nicobar Islands',
                  'Andhra Pradesh',
                  'Arunachal Pradesh',
                  'Assam',
                  'Bihar',
                  'Chandigarh',
                  'Dadar Nagar Haveli',
                  'Delhi',
                  'Goa',
                  'Gujarat',
                  'Haryana',
                  'Himachal Pradesh',
                  'Jammu and Kashmir',
                  'Jharkhand',
                  'Karnataka',
                  'Kerala',
                  'Ladakh',
                  'Madhya Pradesh',
                  'Maharashtra',
                  'Manipur',
                  'Meghalaya',
                  'Mizoram',
                  'Odisha',
                  'Puducherry',
                  'Punjab',
                  'Rajasthan',
                  'Tamil Nadu',
                  'Telengana',
                  'Tripura',
                  'Uttarakhand',
                  'Uttar Pradesh',
                  'West Bengal',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
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
                            Color.fromRGBO(19, 84, 122, 1).withOpacity(0.5),
                            Colors.grey.shade100.withOpacity(0.5)
                          ],
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      child: Stats_card2(context, "Confirmed Cases", "",
                          "assets/images/notification_red.svg"),
                    );
                  case ConnectionState.waiting:
                    return ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromRGBO(19, 84, 122, 1).withOpacity(0.5),
                            Colors.orangeAccent.withOpacity(0.5)
                          ],
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      child: Stats_card2(context, "Confirmed Cases", "",
                          "assets/images/notification_blue.svg"),
                    );
                  default:
                    if (snapshot.hasError)
                      return ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(19, 84, 122, 1).withOpacity(0.5),
                              Colors.red.withOpacity(0.5)
                            ],
                          ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height));
                        },
                        child: Stats_card2(context, "Confirmed Cases", "",
                            "assets/images/notification_red.svg"),
                      );
                    else
                      return Stats_card2(context, "Confirmed Cases",
                          snapshot.data, "assets/images/notification_red.svg");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
