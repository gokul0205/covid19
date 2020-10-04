import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class Stats_card extends StatelessWidget {
  final String header;
  final BuildContext context;
  final String number;
  final String resource;
  //The lines in comment are those genera
//  const Stats_card({
//    Key key,
//    @required this.context,this.header,
//  }) : super(key: key);
  Stats_card(this.context,this.header,this.number,this.resource);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width:(constraints.maxWidth/2) -10,
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(6.0),
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
                            fontSize: 11,
                          ),
//                        overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                            text:TextSpan(
                              children: [
                                TextSpan( text:"$number \n",
                                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 27,)
                                ),
                                TextSpan(text:"  people",
                                  style: TextStyle(
                                    fontSize: 12,height: 2,color:Colors.black54,
                                  ),),
                              ],

                            )
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
