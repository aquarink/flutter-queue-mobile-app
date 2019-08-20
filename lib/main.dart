import 'dart:async';

import 'package:bottom_bar_fab_flutter/fab/fab_bottom_app_bar.dart';
import 'package:bottom_bar_fab_flutter/fab/layout.dart';

import 'package:bottom_bar_fab_flutter/screens/bottomnav/home.dart';
import 'package:bottom_bar_fab_flutter/screens/bottomnav/queue.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:barcode_scan/barcode_scan.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Mobiwin Antrian System',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Mobiwin Antrian by Pebriant'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  String labelToShow = 'Welcome to Mobiwin Queue System';

  void _selectedTab(int index) {
    // setState(() {
    //   if(index == 0) {
    //     _lastSelected = 'YOU AT HOME';
    //   } else if(index == 1) {
    //     _lastSelected = 'YOU AT QUEUE';
    //   } else if(index == 2) {
    //     _lastSelected = 'YOU AT SEARCH';
    //   } else if(index == 3) {
    //     _lastSelected = 'YOU AT PROFILE';
    //   }
      
    // });

      if(index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else if(index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QueueScreen()),
        );
      } else if(index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else if(index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QueueScreen()),
        );
      }
  }


  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        labelToShow = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          labelToShow = "Camera permission was denied";
        });
      } else {
        setState(() {
          labelToShow = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        labelToShow = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        labelToShow = "Unknown Error $ex";
      });
    }
  }

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
      body: Center(
        child: Text(
          labelToShow,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'SCAN',
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.view_list, text: 'Queue'),
          FABBottomAppBarItem(iconData: Icons.search, text: 'Search'),
          FABBottomAppBarItem(iconData: Icons.group, text: 'Profile'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(
          context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [ Icons.sms, Icons.mail, Icons.phone ];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0)
        );
      },
      child: FloatingActionButton(
        onPressed: _scanQR,
        tooltip: 'Increment',
        child: Icon(Icons.select_all),
        backgroundColor: Color.fromRGBO(242, 48, 67, 1.0),
        elevation: 2.0,
      ),
    );
  }
}
