import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(242, 48, 67, 1.0),
        title: Column(
          children: <Widget>[
            Text("MOBIWIN ANTRIAN",
                style: TextStyle(color: Colors.white, fontSize: 25.0)),
            Text("ANTRI DAN DAPATKAN DISCOUNT",
                style: TextStyle(color: Colors.white, fontSize: 9.0)),
          ],
        ),
      ),
      body: HomeScreenStl()
    );
  }
}

class HomeScreenStl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('HOME SCREEN'),
    );
  }
}

