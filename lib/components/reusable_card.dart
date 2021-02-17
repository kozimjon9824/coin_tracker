import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {

  ReusableCard(this.rate);
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child:
        Text(rate,style:
        TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),
        ),
        ),
      ) ,
      color: Colors.lightBlue[300],
      shadowColor: Colors.indigoAccent,
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

    );
  }
}
