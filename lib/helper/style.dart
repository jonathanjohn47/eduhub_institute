/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Flutter UI Kit
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2021-present initappz.
*/
import 'package:eduhub_institute/core/app_colors.dart';
import 'package:flutter/material.dart';



headText() {
  return TextStyle(
      fontSize: 18.0, fontFamily: 'semi-bold', color: Colors.black);
}

simpleText() {
  return TextStyle(fontFamily: 'regular', fontSize: 14);
}

simpleButton() {
  return ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: AppColors.primary,
    minimumSize: const Size.fromHeight(50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );
}

simpleInputIconText(text, icn) {
  return InputDecoration(
      hintText: "$text",
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(15)),
      prefixIcon: icn,
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16));
}

simpleInputText(text) {
  return InputDecoration(
    border: InputBorder.none,
    hintText: text,
    hintStyle: TextStyle(color: Colors.grey.shade400),
    filled: true,
    fillColor: Colors.white,
  );
}

searchbar() {
  return TextField(
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Search here...',
      prefixIcon: Icon(Icons.search, color: Colors.black54),
      hintStyle: TextStyle(color: Colors.grey.shade400),
      filled: true,
      fillColor: Colors.white,
    ),
  );
}

inputTextFieldDecoration(val, icn) {
  return InputDecoration(
    contentPadding: EdgeInsets.all(0),
    labelText: '$val',
    floatingLabelStyle: TextStyle(color: Colors.grey),
    suffixIcon: icn != '' ? Icon(icn, color: AppColors.primary) : null,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            width: 2,
            color: (Colors.grey[300])!
        )
    ),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            width: 2,
            color: AppColors.primary
        )
    ),
  );
}


outlineButton() {
  return OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      elevation: 0,
      primary: Colors.black,
      textStyle: TextStyle(
        fontFamily: 'medium',
        letterSpacing: 0.5,
        fontSize: 16,
      )
  );
}

shadowContainer() {
  return BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: (Colors.grey[200])!,
            blurRadius: 5.0,
            offset: Offset(
              0.0,
              0.0,
            )
        ),
      ],
      borderRadius: BorderRadius.all(
          Radius.circular(5)
      ),
      color: Colors.white
  );
}

pageTitle() {
  return TextStyle(
      color: Colors.black,
      fontFamily: 'semi-bold',
      fontSize: 20
  );
}

roundImage(val) {
  return BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.all(
          Radius.circular(16)
      ),
      image: DecorationImage(
          image: AssetImage('$val'),
          fit: BoxFit.cover
      )
  );
}

bottomBorder() {
  return BoxDecoration(
      border: Border(
          bottom: BorderSide(
              width: 1,
              color: (Colors.grey[300])!
          )
      )
  );
}

offContainer() {
  return BoxDecoration(
      borderRadius: BorderRadius.all(
          Radius.circular(5)
      ),
      color: Color.fromARGB(255, 255,185,48)
  );
}

offLabel() {
  return TextStyle(
      color: Colors.white,
      fontFamily: 'medium'
  );
}
