import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String nameString = '';
  String _platformImei = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
    findDisplayName();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformImei;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformImei = await ImeiPlugin.getImei( shouldShowRequestPermissionRationale: false );
    } on PlatformException {
      platformImei = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformImei = platformImei;
    });
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
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Plugin example app'),
        // ),
        body: Center(
          // child: Text('Running on: $_platformImei\n'),
          child: Text('Login by $nameString'),
        ),
      ),
    );
  }
}