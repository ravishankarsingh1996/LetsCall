import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lets Call',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: VoiceCallPage(),
    );
  }
}

class VoiceCallPage extends StatefulWidget {
  @override
  _VoiceCallPageState createState() => _VoiceCallPageState();
}

class _VoiceCallPageState extends State<VoiceCallPage> {
  Timer _timmerInstance;
  int _start = 0;
  String _timmer = '';

  void startTimmer() {
    var oneSec = Duration(seconds: 1);
    _timmerInstance = Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              if (_start < 0) {
                _timmerInstance.cancel();
              } else {
                _start = _start + 1;
                _timmer = getTimerTime(_start);
              }
            }));
  }
  

  String getTimerTime(int start) {
    int minutes = (start ~/ 60);
    String sMinute = '';
    if (minutes.toString().length == 1) {
      sMinute = '0' + minutes.toString();
    } else
      sMinute = minutes.toString();

    int seconds = (start % 60);
    String sSeconds = '';
    if (seconds.toString().length == 1) {
      sSeconds = '0' + seconds.toString();
    } else
      sSeconds = seconds.toString();

    return sMinute + ':' + sSeconds;
  }

  @override
  void initState() {
    super.initState();
    startTimmer();
  }
  
  @override
  void dispose() {
    _timmerInstance.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Text(
                'VOICE CALL',
                style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.w300,
                    fontSize: 15),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Ravi Shankar Singh',
                style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.w900,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                _timmer,
                style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.w300,
                    fontSize: 15),
              ),
              SizedBox(
                height: 20.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(200.0),
                child: Image.network(
                  'https://avatars3.githubusercontent.com/u/20386271?s=460&v=4',
                  height: 200.0,
                  width: 200.0,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FunctionalButton(
                    title: 'Speaker',
                    icon: Icons.phone_in_talk,
                    onPressed: () {},
                  ),
                  FunctionalButton(
                    title: 'Video Call',
                    icon: Icons.videocam,
                    onPressed: () {},
                  ),
                  FunctionalButton(
                    title: 'Mute',
                    icon: Icons.mic_off,
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 120.0,
              ),
              FloatingActionButton(
                onPressed: () {},
                elevation: 20.0,
                shape: CircleBorder(side: BorderSide(color: Colors.red)),
                mini: false,
                child: Icon(
                  Icons.call_end,
                  color: Colors.red,
                ),
                backgroundColor: Colors.red[100],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FunctionalButton extends StatefulWidget {
  final title;
  final icon;
  final Function() onPressed;

  const FunctionalButton({Key key, this.title, this.icon, this.onPressed})
      : super(key: key);

  @override
  _FunctionalButtonState createState() => _FunctionalButtonState();
}

class _FunctionalButtonState extends State<FunctionalButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RawMaterialButton(
          onPressed: widget.onPressed,
          splashColor: Colors.deepPurpleAccent,
          fillColor: Colors.white,
          elevation: 10.0,
          shape: CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              widget.icon,
              size: 30.0,
              color: Colors.deepPurpleAccent,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 15.0, color: Colors.deepPurpleAccent),
          ),
        )
      ],
    );
  }
}
