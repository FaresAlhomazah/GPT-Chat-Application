import 'package:flutter/material.dart';

void ShowSnackBar(BuildContext context,String SnackBarText,Color SnackBarBackColor) {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(SnackBarText,style: TextStyle(color:SnackBarBackColor,fontWeight: FontWeight.bold),textAlign:TextAlign.center,),
           backgroundColor: Colors .black,));
  }
