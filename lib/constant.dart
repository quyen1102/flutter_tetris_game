import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color backgroundColor = const Color(0xFF462466);

toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.amber,
      textColor: Colors.white,
      fontSize: 16.0);
}
