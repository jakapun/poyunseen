import 'dart:io';

import 'package:flutter/material.dart';
import 'package:poyunseen/screens/form_page.dart';
import 'package:poyunseen/screens/listview_page.dart';
import 'package:poyunseen/screens/my_home.dart';
import 'package:poyunseen/screens/qr_reader.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String nameString = '';
  Widget currentWidget = MyHomePage();
  //Widget currentWidget = ListViewPage();

  // method

  Widget menuFormPage() {
    return ListTile(
      leading: Icon(
        Icons.all_out,
        size: 36.0,
        color: Colors.red,
      ),
      title: Text(
        'Form',
        style: TextStyle(fontSize: 18.0),
        ),
      // on tap == on click
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          currentWidget = FormPage();
        });
      },
    ); // https://material.io/resources/icons/?style=baseline
  }

  Widget menuListViewPage() {
    return ListTile(
      leading: Icon(
        Icons.all_out,
        size: 36.0,
        color: Colors.purple,
      ),
      title: Text(
        'Listview',
        style: TextStyle(fontSize: 18.0),
        ),
      // on tap == on click
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          currentWidget = ListViewPage();
        });
      },
    ); // https://material.io/resources/icons/?style=baseline
  }

  Widget menuQRcode() {
    return ListTile(
      leading: Icon(
        Icons.android,
        size: 36.0,
        color: Colors.purple,
      ),
      title: Text(
        'QR code Reader',
        style: TextStyle(fontSize: 18.0),
      ),
      onTap: () {
        setState(() {
          currentWidget = QRreader();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget signOutAnExit() {
    return ListTile(
      leading: Icon(
        Icons.exit_to_app,
        size: 36.0,
        color: Colors.red,
      ),
      title: Text(
        'Sign Out & Exit',
        style: TextStyle(fontSize: 18.0),
      ),
      onTap: () {
        mySignOut();
      },
    );
  }

  Future<void> mySignOut() async {
    await firebaseAuth.signOut().then((response) {
      exit(0);
    });
  }

  Widget showLogo() {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Image.asset(
          'images/logo.png'), // https://www.iconfinder.com/search/?q=travel&price=free&maximum=512
    );
  }

  Widget myHead() {
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'images/wallpaper.jpg'), // https://pixabay.com/th/photos/phuket-unseen-unseen-phuket-plant-3664495/
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          showLogo(),
          Text(
            'Poy Flutter',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.blue[900],
            ),
          ),
          Text('Login by $nameString'),
        ],
      ),
    );
  }

  Widget myDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          myHead(),
          menuListViewPage(),
          Divider(),
          menuFormPage(),
          Divider(),
          menuQRcode(),
          Divider(),
          signOutAnExit(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      nameString = firebaseUser.email;
    });
    print('name = $nameString');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),
      body: currentWidget,
      drawer: myDrawer(), // call drawer
    );
  }
}
