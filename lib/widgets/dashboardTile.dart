import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:destinations/const/colors.dart';
import 'package:destinations/const/styles.dart';


class DashBoardTile extends StatelessWidget {
  DashBoardTile({Key? key,required this.title,required this.image,required this.callB}) : super(key: key);

  String image,title;
  Function callB;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 20),
      child: InkWell(
        onTap: (){callB();},
        child: Container(
          height: w/2.7,
          width: w/2.7,
          child: Card(
            elevation: 10,
            shadowColor: g8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(80),
            )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15,),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(image,height: w/8,color: primary,),
                  SizedBox(height: 12,),
                  Text(
                    title,
                    style: Style().textStyle(size: 15, w: FontWeight.w900, color: black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
