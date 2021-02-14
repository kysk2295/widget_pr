import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
         visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String sum='';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2=TextEditingController();
  List _buttonList=['더하기','빼기','곱하기','나누기'];
  List <DropdownMenuItem<String>> _dropDownMenuItems = new List();
  String _buttonText;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(var item in _buttonList){
      _dropDownMenuItems.add(DropdownMenuItem(value: item,child: Text(item),));
    }
    _buttonText=_dropDownMenuItems[0].value;
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Example'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('결과 : $sum', style: TextStyle(fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: TextField(keyboardType: TextInputType.number,controller: value1,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: TextField(keyboardType: TextInputType.number,controller: value2,),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: RaisedButton(
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Text(_buttonText)
                    ],
                  ),
                    color: Colors.amber,
                    onPressed: (){
                    setState(() {

                      var valueInt=double.parse(value1.value.text);
                      var value2Int=double.parse(value2.value.text);
                      var result;
                      if(_buttonText ==' 더하기'){
                        result=valueInt+value2Int;
                      }
                      else if(_buttonText ==' 빼기'){
                        result=valueInt-value2Int;
                      }
                      else if(_buttonText ==' 곱하기'){
                        result=valueInt*value2Int;
                      }
                      else if(_buttonText =='나누기'){
                        result=valueInt/value2Int;
                      }
                      sum='$result';

                    });

                }),
              ),
              Padding(padding: EdgeInsets.all(15),
              child: DropdownButton(items: _dropDownMenuItems,onChanged:(value){
                setState(() {
                  _buttonText=value;
                });
              }, value: _buttonText,
              ),)
            ],
          ),
        ),
      ),
    );



  }
}
