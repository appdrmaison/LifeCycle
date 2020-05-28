import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lifecyclemed/Home.dart';
import 'package:lifecyclemed/mainLogin.dart';


void main(){
runApp(MaterialApp(
  home: mainLogin(),
  theme: ThemeData(
    primaryColor: Color (0xff380A17),
       accentColor : Color (0xff0380A17)
  ),
  debugShowCheckedModeBanner: false,


));

  
}