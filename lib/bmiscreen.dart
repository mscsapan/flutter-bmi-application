import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  double _height = 100.0;
  double _weight = 30.0;
  double _bmi = 0.0;

  final TextEditingController _teController = new TextEditingController();

  void _bmiCalculate() {
    _bmi = _weight / ((_height / 100) * (_height / 100));
    print(_bmi);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Lacquer',
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
        child: new Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 20),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                child: Image.asset(
                  "design/images/heart.png",
                  color: Colors.red[600],
                  fit: BoxFit.cover,
                ),
                height: 200,
                width: 200,
              ),
              /*SizedBox(
                height: 4,
              ),*/
              new Text(
                "BMI Calculator",
                style: TextStyle(
                  color: Colors.red[700],
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Lacquer",
                ),
              ),
              new Text(
                "We care about your health!",
                style: TextStyle(
                  color: Colors.teal,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              new Text(
                "Your Height(cm)",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: new Slider(
                  min: 80.0,
                  max: 250.0,
                  value: _height,
                  onChanged: (height) {
                    setState(() {
                      _height = height;
                    });
                  },
                  activeColor: Colors.deepOrange[800],
                  inactiveColor: Colors.red[800],
                  divisions: 100,
                  label: "$_height",
                ),
              ),
              new Text(
                "$_height cm ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 6,
              ),
              new Text(
                "Your Weight(kg)",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  fontFamily: 'ComicNeue',
                ),
              ),
              new Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: new Slider(
                    min: 30.0,
                    max: 120.0,
                    inactiveColor: Colors.red[800],
                    activeColor: Colors.deepOrange[800],
                    divisions: 10,
                    label: "$_weight",
                    value: _weight,
                    onChanged: (weight) {
                      setState(() {
                        _weight = weight;
                      });
                    }),
              ),
              new Text(
                "$_weight kg",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 8),
                child: new TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.favorite,
                      color: Colors.teal,
                    ),
                    hintText: "$_weight",
                    // contentPadding:
                  ),
                  controller: _teController,
                ),
              ),
              new Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 25, right: 25, top: 15),
                child: RaisedButton.icon(
                  color: Colors.deepOrange[800],
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      _bmiCalculate();
                      /* _bmi = _weight / ((_height/100)*(_height/100));
                      print(_bmi);*/
                    });
                  },
                  label: Text(
                    "Calculate",
                    style: TextStyle(
                        fontSize: 22,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Lacquer'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
