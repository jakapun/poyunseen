import 'package:flutter/material.dart';
import 'package:poyunseen/models/unseem_model.dart';

class ShowDetail extends StatefulWidget {
  final UnseenModel unseenModel;
  ShowDetail({Key key, this.unseenModel}) : super(key: key);

  @override
  _ShowDetailState createState() => _ShowDetailState();
}

class _ShowDetailState extends State<ShowDetail> {
  // explicit
  UnseenModel myUnseenModel;

  // Method
  @override
  void initState() {
    super.initState();
    myUnseenModel = widget.unseenModel;
  }

  Widget showName() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(myUnseenModel.name, style:  TextStyle(fontSize: 20.0, color: Colors.blue.shade900),),
      ],
    );
  }

  Widget showDetail123() {
    return Text(myUnseenModel.detail);
  }

  Widget showPic() {
    return Container(
      height: 200.0,child: Image.network(myUnseenModel.urlPicture),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: ListView(
        children: <Widget>[
          showName(),
          showPic(),
          showDetail123(),
        ],
      ),
    );
  }
}
