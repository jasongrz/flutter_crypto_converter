import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(new MaterialApp(title: 'CRYPTO CONVERTER', home: new TipCalculator()));
}

class CustomButton extends StatelessWidget {
  CustomButton({this.text,this.onPressed});
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: FlatButton(
          onPressed:onPressed,
          child: Text(
            text,
            style: TextStyle(fontFamily: 'OpenSans', color: Colors.white, fontSize: 30.0),
          ),
        ));
  }
}

class OperatorButton extends StatelessWidget {
  OperatorButton({this.onPressed,this.text});
  final text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: FlatButton(
          onPressed:onPressed,
          child: Text(
            text,
            style: TextStyle(fontFamily: 'OpenSans', color: Colors.white, fontSize: 30.0),
          ),
        ));
  }
}

class TipView extends StatelessWidget {
  double _bitAmount = 0.0;
  
  TipView(this._bitAmount);

  @override
  Widget build(BuildContext context) {
      var formatCurrency = new NumberFormat.currency(decimalDigits: 2, symbol: "");
      double _bitPercentage1 = 3935.61;
      double _calculatedAmount1 = _bitAmount * _bitPercentage1;
      String _bitAmountStr = _bitAmount.toStringAsFixed(2);
      String _calculatedAmount1Str =_calculatedAmount1.toStringAsFixed(2);

    var dollarSign = new Text("\$", textAlign: TextAlign.left, style: TextStyle(fontFamily: 'OpenSans', color: Colors.white.withOpacity(0.30), fontSize: 30.0));

    var widget1 = new Text(" ${formatCurrency.format(_calculatedAmount1)}", textAlign: TextAlign.left, style: TextStyle(fontFamily: 'OpenSans', color: Colors.white.withOpacity(0.6), fontSize: 30.0));

     return  Container(
                  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight, // 10% of the width, so there are ten blinds.
      colors: [const Color(0xFF30026d), const Color(0xFF3c0584)], // whitish to gray
      tileMode: TileMode.repeated, // repeats the gradient over the canvas
    ),
  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [dollarSign, widget1]),
                      ],
                    ),
                  ),
                );

  }
}
class TipCalculator extends StatefulWidget {
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double _bitAmount = 0.0;
  var _bitAmountStr = "0";

  @override
  Widget build(BuildContext context) {
  var dollarSign = new Text("\B ", textAlign: TextAlign.left, style: TextStyle(fontFamily:'OpenSans' ,color: Colors.white.withOpacity(0.30), fontSize: 30.0));


    var result_row = Container(
          decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight, // 10% of the width, so there are ten blinds.
      colors: [const Color(0xFF30026d), const Color(0xFF3c0584)], // whitish to gray
      tileMode: TileMode.repeated, // repeats the gradient over the canvas
    ),
  ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: <Widget>[
                Row(
              children: [
                  dollarSign,
                  Text(_bitAmountStr,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 30.0)
                        ),
                ]),
              ],
            ),
          ),
        );
    
    void buttonPressed(var char){
      setState(() {
        try{
          if(_bitAmountStr=="0"){
            _bitAmount = double.parse(char);
            _bitAmountStr = char;
          }else{
          _bitAmount = double.parse(_bitAmountStr + char);
          _bitAmountStr += char;
          }
        }catch(e){
          _bitAmount = double.parse(_bitAmountStr);
        } 
      });
    }
    
    var buttonRow1 =  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: <Widget>[
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomButton(
                    text: "7",
                    onPressed: (){ buttonPressed("7");},
                  ),
                  CustomButton(
                    text: "8",
                    onPressed: (){ buttonPressed("8");}
                  ),
                  CustomButton(
                    text: "9",
                    onPressed: (){ buttonPressed("9");}
                  ),
                ],
              ),
              
            ],
          ),
        ),
      );

      var buttonRow2 =  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: <Widget>[
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomButton(
                    text: "4",
                    onPressed: (){ buttonPressed("4");}
                  ),
                  CustomButton(
                    text: "5",
                    onPressed:(){ buttonPressed("5");}
                  ),
                  CustomButton(
                    text: "6",
                    onPressed: (){ buttonPressed("6");}
                  ),
                ],
              ),
              
            ],
          ),
        ),
      );

      var buttonRow3 =  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: <Widget>[
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomButton(
                    text: "1",
                    onPressed: (){ buttonPressed("1");}
                  ),
                  CustomButton(
                    text: "2",
                    onPressed: (){ buttonPressed("2");}
                  ),
                  CustomButton(
                    text: "3",
                    onPressed:(){ buttonPressed("3");}
                  ),
                ],
              ),
              
            ],
          ),
        ),
      );

      var buttonRow4 =  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: <Widget>[
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    
                  CustomButton(
                    text: ".",
                    onPressed: (){ buttonPressed(".");}
                  ),
                  CustomButton(
                    text: "0",
                    onPressed: (){ buttonPressed("0");}
                  ),
                   OperatorButton(
                    text: "X",
                    onPressed: (){ setState(() {
                     _bitAmountStr="0"; 
                     _bitAmount=0;
                    });},
                  ),
                ],
              ),
              
            ],
          ),
        ),
      );

    Container container = new Container(
        padding: const EdgeInsets.all(16.0),
        child: new Column( mainAxisAlignment: MainAxisAlignment.start,
            children: [ result_row, new TipView(_bitAmount), Container(child:SizedBox(height:150)), buttonRow3, buttonRow2, buttonRow1, buttonRow4]));


    AppBar appBar = new AppBar(title: new Text("CRYPTO CONVERTER", style: TextStyle(fontSize: 12.0),),centerTitle: true, backgroundColor: const Color(0xFF3c0584), elevation: 0.0,);

    Scaffold scaffold = new Scaffold(appBar: appBar, body: container, backgroundColor: const Color(0xFF3c0584));
    return scaffold;
  }
}