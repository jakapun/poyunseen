import 'package:flutter/material.dart';
import 'package:poyunseen/screens/form_page.dart';
import 'package:poyunseen/screens/listview_page.dart';
import 'package:poyunseen/screens/my_home.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // explicit

  Widget currentWidget = MyHomePage();

  // method

  Widget menuFormPage() {
    return ListTile(
      leading: Icon(
        Icons.all_out,
        size: 36.0,
        color: Colors.red,
      ),
      title: Text('Form'),
      subtitle: Text('Form Page for Input Value'),
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
      title: Text('Listview'),
      subtitle: Text('หน้าที่แสดงข้อมูล'),
      // on tap == on click
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
         currentWidget = ListViewPage(); 
        });
      },
    ); // https://material.io/resources/icons/?style=baseline
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
            'Poy Unseen',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.blue[900],
            ),
          ),
          Text('share every thing from thailand'),
        ],
      ),
    );
  }

  Widget myDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          myHead(),
          menuFormPage(),
          Divider(),
          menuListViewPage(),
          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),
      body: currentWidget, drawer: myDrawer(), // call drawer
    );
  }
}
