import 'package:flutter/material.dart';
import 'package:intern_task/controller/unix_to_normal_time.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TimeStampConverter times = TimeStampConverter();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(times.getTimeStamp(1639575285192));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
    );
  }
}