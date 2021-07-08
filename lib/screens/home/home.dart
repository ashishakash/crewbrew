import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/brew.dart';
import 'package:firebase_app/screens/home/brew_list.dart';
import 'package:firebase_app/screens/home/settings_form.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:firebase_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showsettingspanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0,),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text('Brew crew'),
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text('logout'),
            ),
            FlatButton.icon(
                onPressed: () => _showsettingspanel(),
                icon: Icon(Icons.settings),
                label: Text('settings')),
          ],
        ),
        backgroundColor: Colors.brown[100],
        body: BrewList(),
      ),
    );
  }
}
