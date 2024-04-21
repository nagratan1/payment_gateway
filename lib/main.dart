import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pyament/pymant.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;


void main() 
async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey='pk_test_51Nk9uNSD595mdAB3rWlkxYV0fXKJdAEa2raavSmyoLlgfmbOpb5k9Sqn1jbXq9eajWusqIVPb1zu5UGaubPe2YW300an5iGfXF';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: pyament(),
    );
  }
}


