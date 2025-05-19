
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


PreferredSizeWidget appBarDesign(){
  return AppBar(
    backgroundColor: Colors.blueGrey,
    elevation: 2,
    title: Center(
      child: Text(
        'Notes',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}