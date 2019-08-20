import 'package:flutter/material.dart';

class DetailJadwal extends StatefulWidget {
  final String jadwalparse;
  DetailJadwal({Key key, @required this.jadwalparse}) : super(key: key);

  @override
  _DetailJadwalState createState() => _DetailJadwalState();
}

class _DetailJadwalState extends State<DetailJadwal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Column(
          children: <Widget>[
            Text("وقت NGAJI",
                style: TextStyle(color: Colors.white, fontSize: 25.0)),
            Text("WAKTUNYA RAMAIKAN PENGAJIAN",
                style: TextStyle(color: Colors.white, fontSize: 9.0)),
          ],
        ),
      ),
      body: DetailJadwalSTL(idjdw: widget.jadwalparse,)
    );
  }
}

class DetailJadwalSTL extends StatelessWidget {
  final String idjdw;
  DetailJadwalSTL({Key key, this.idjdw}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Detail Jadwal '+ idjdw),
    );
  }
}
