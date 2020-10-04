import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class Stats_card2 extends StatelessWidget {
  final String header;
  final BuildContext context;
  final String number;
  final String resource;
  //The lines in comment are those genera
//  const Stats_card({
//    Key key,
//    @required this.context,this.header,
//  }) : super(key: key);
Stats_card2(this.context,this.header,this.number,this.resource);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:20,right: 20,top:5,bottom: 5),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width:(constraints.maxWidth) -100,
            decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height:30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(0.75),
                              shape: BoxShape.circle,

                          ),
                          child: SvgPicture.asset(resource,
                            height: 22,
                            width: 22,),
                        ),
                        Text(
                          header,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                          ),
//                        overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0,10, 0),
                        child: RichText(
                            text:TextSpan(
                              children: [
                                TextSpan( text:"  $number \n",
                                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 40,)
                                ),
                                TextSpan(text:"         people",
                                  style: TextStyle(
                                    fontSize: 12,color:Colors.black54,
                                  ),),
                              ],

                            )
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
