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
  return const TextStyle(
      fontSize: 18.0, fontFamily: 'semi-bold', color: Colors.black);
}

simpleText() {
  return const TextStyle(fontFamily: 'regular', fontSize: 14);
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
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16));
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
    style: const TextStyle(color: Colors.black),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Search here...',
      prefixIcon: const Icon(Icons.search, color: Colors.black54),
      hintStyle: TextStyle(color: Colors.grey.shade400),
      filled: true,
      fillColor: Colors.white,
    ),
  );
}

inputTextFieldDecoration(val, icn) {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(0),
    labelText: '$val',
    floatingLabelStyle: const TextStyle(color: Colors.grey),
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
      foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      elevation: 0,
      textStyle: const TextStyle(
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
            offset: const Offset(
              0.0,
              0.0,
            )
        ),
      ],
      borderRadius: const BorderRadius.all(
          Radius.circular(5)
      ),
      color: Colors.white
  );
}

pageTitle() {
  return const TextStyle(
      color: Colors.black,
      fontFamily: 'semi-bold',
      fontSize: 20
  );
}

roundImage(val) {
  return BoxDecoration(
      color: Colors.grey[300],
      borderRadius: const BorderRadius.all(
          Radius.circular(16)
      ),
      image: DecorationImage(
          image: NetworkImage('$val'),
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
  return const BoxDecoration(
      borderRadius: BorderRadius.all(
          Radius.circular(5)
      ),
      color: Color.fromARGB(255, 255,185,48)
  );
}

offLabel() {
  return const TextStyle(
      color: Colors.white,
      fontFamily: 'medium'
  );
}

greyText(val) {
  return Text(
    val,
    style: const TextStyle(fontSize: 14, color: Colors.black54),
  );
}

greyTextSmall(val) {
  return Text(
    val,
    style: const TextStyle(fontSize: 12, color: Colors.black54),
  );
}

blackText(val) {
  return Container(
    child: Text(
      val,
      style: const TextStyle(fontSize: 14, fontFamily: 'bold'),
    ),
  );
}

blackBoldText(val) {
  return Text(
    val,
    style: const TextStyle(fontSize: 16, fontFamily: 'bold'),
  );
}

blackHeading(val) {
  return Text(
    val,
    style: const TextStyle(fontSize: 20, fontFamily: 'bold'),
  );
}

appColorText(val) {
  return Text(
    val,
    style: TextStyle(fontSize: 14, fontFamily: 'bold', color: AppColors.primary),
  );
}

textField(hint, icn) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextField(
      decoration: InputDecoration(
        labelText: hint,
        suffixIcon: Icon(
          icn,
          color: Colors.black12,
        ),
        labelStyle: const TextStyle(color: Colors.black54, fontSize: 12),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),
      ),
    ),
  );
}

SearchBox(hint) {
  return Container(
    color: Colors.transparent,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 8.0),
        ],
      ),
      child: TextField(
        onChanged: (String txt) {},
        style: const TextStyle(
          fontSize: 18,
        ),
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black26),
            prefixIcon: const Icon(
              Icons.location_on,
              color: Colors.black26,
            )),
      ),
    ),
  );
}

