import 'package:flutter/material.dart';
import 'package:instagram/pages/fastfood.dart';
import 'package:instagram/pages/Vegetables.dart';
import 'package:instagram/pages/snack.dart';

import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const home(),
      '/vegetable': (context) => const Vegetables(), 
      '/fastfood': (context) => const Fastfood(), 
      '/snack':(context)=> const Snack(),

    },
  ));
}
