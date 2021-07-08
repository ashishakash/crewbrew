import 'package:firebase_app/models/user.dart';
import 'package:firebase_app/screens/authenticate/authenticate.dart';
import 'package:firebase_app/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Usero>(context);
    if (user != null)
      return Home();
    else
      return Authenticate();
  }
}
