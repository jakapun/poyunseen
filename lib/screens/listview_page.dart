import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  // explicit

  // method
  @override
  void initState() {
    super.initState();
    readDataFireStore();
  }

  // create instance

  Future<void> readDataFireStore() async {
    Firestore firestore = Firestore.instance;

    // create collect referrence -> because not collection name
    CollectionReference collectionReference = firestore.collection('Unseen');
    // snapshot == dbs -> collections -> document per document
    await collectionReference.snapshots().listen((response) {

      // snapshots == array because put s
      List<DocumentSnapshot> snapshots = response.documents;
      for (var snapshot in snapshots) {
        String name = snapshot.data['Name'];
        print('name = $name');
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('List View Page');
  }
}
