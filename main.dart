import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MaterialApp(
  home: Calculator(),
  )
);

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  //this is what gets printed on the screen
  String result='0';
  //this is the hidden number that is printed when 
  //= button is pressed
  String answer='Not Set';
  //this is the size of the numbers printed to screen
  double numberSize=70;

  //all the normal buttons except '=' and backspace
  Widget fancyButton(String text){
    return Expanded(
        child: SizedBox(
        width: 90,
        height: 80,
        child: RaisedButton(
          onPressed: (){
            setState(() {

              if (result=='0') {
                result=text;
              } else {
                //adds whatever button is pressed to the result var 
                result=result+text;
              }
              
              //changes the font size to adjust to the screen size
              if(numberSize>30){
                numberSize-=2;
              }
            });
          },
          child: Text(text, style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }

  Widget backSpaceButton(){
    return Expanded(
        child: SizedBox(
        width: 90,
        height: 80,
        child: RaisedButton(
          onPressed: (){
            setState(() {
              //removes the last character from result var
              result=result.substring(0,result.length-1);
              //adjusts the font size to screen
              if(numberSize<70){
                numberSize+=1;
              }
            });
          },
          //removes all the text from screenand prints 0 when long pressed
          onLongPress: (){
            setState(() {
              result='0';
              numberSize=70;
            });
          },
          child: Icon(
            Icons.backspace,
          ),
        ),
      ),
    );
  }

  Widget displayScreen(){
    return Container(
              child: Text(
                result,
                style: TextStyle(
                  fontSize: numberSize
                ),
              ),
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
            );
  }

  Widget equaltoButton(String text){
    return Expanded(
        child: SizedBox(
        width: 90,
        height: 80,
        child: RaisedButton(
          color: Colors.blueAccent,
          //when pressed, swaps value of result with the
          //previously set value(answer var)
          onPressed: (){
            setState(() {
              result=answer;
            });
          },
          //saves whatever is on the screen to
          //display later on and clears the screen
          onLongPress: (){
            setState(() {
              answer=result;
              result='0';
              numberSize=70;
            });
          },
          child: Text(text, style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calculator"),
      ),

      //The two rows inside the first column
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          //Screen part
          Expanded(
            flex: 1,
            child: displayScreen(),
          ),

          Expanded(
            flex: 3,
            //Buttons part
            child: Row(
              children: <Widget>[

                //first column
                Column(
                  children: <Widget>[

                    fancyButton("7"),

                    fancyButton("4"),

                    fancyButton("1"),

                    fancyButton("0"),

                  ],
                ),

                //second column
                Column(

                  children: <Widget>[

                    fancyButton("8"),

                    fancyButton("5"),

                    fancyButton("2"),

                    fancyButton("."),

                  ],

                ),

                //Third column
                Column(

                  children: <Widget>[

                    fancyButton("9"),

                    fancyButton("6"),

                    fancyButton("3"),

                    equaltoButton("="),

                  ],

                ),

                //fourth column
                Column(

                  children: <Widget>[

                    backSpaceButton(),

                    fancyButton("/"),

                    fancyButton("x"),

                    fancyButton("+"),

                    fancyButton("-"),

                  ],

                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}