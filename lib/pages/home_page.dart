import 'package:flutter/material.dart';
import 'package:friva/pages/game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;

  double _currentdifficultylevel = 0;

  final List<String> _difficultytexts = ["Easy", "Medium", "Hard"];

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.01),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _apptitle(),
              _difficultyslider(),
              _startgamebtn(),
            ],
          ),
        ),
      )),
    );
  }

  Widget _apptitle() {
    return Column(
      children: [
        Text(
          "Frivia",
          style: TextStyle(
              color: Colors.white, fontSize: 50, fontWeight: FontWeight.w500),
        ),
        Text(
          _difficultytexts[_currentdifficultylevel.toInt()],
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  Widget _difficultyslider() {
    return Slider(
      label: "Difficulty",
        min: 0,
        max: 2,
        divisions: 3,
        value: _currentdifficultylevel,
        onChanged: (_value) {
          setState(() {
            _currentdifficultylevel = _value;
          });
        });
  }

  Widget _startgamebtn() {
    return MaterialButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext _context){
        return GamePage();
      }));
    },color: Colors.blue,
    minWidth: _deviceWidth  !* 0.80,
    height: _deviceHeight!* 0.10,
    child: Text("Start",style: TextStyle(color: Colors.white, fontSize: 25,),),);
  }
}
