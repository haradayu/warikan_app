import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override 
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("傾斜つき割り勘計算"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 64.0),
            child:
              Row(children: <Widget>[
                Text("合計金額"),
                Flexible(child:
                  TextField(keyboardType: TextInputType.number),
                ),
                Text("円"),
              ],),
          ),
          Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 64.0),
              child:
              Row(children: <Widget>[
                Text("傾斜比率"),
                Flexible(child:
                  TextField(keyboardType: TextInputType.number),
                ),
                Text("倍"),
                Flexible(child:
                  TextField(keyboardType: TextInputType.number),
                ),
                Text("人")
              ],),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 64.0),
              child:
                Row(children: <Widget>[
                  Text("傾斜比率"),
                  Flexible(child:
                    TextField(keyboardType: TextInputType.number),
                  ),
                  Text("倍"),
                  Flexible(child:
                    TextField(keyboardType: TextInputType.number),
                  ),
                  Text("人")
                ],),
            ),
          ],),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child:
              Center(
                child:
                Column(children: <Widget>[
                  Text("支払い金額"),
                  Text("○倍の人 ○円"),
                  Text("○倍の人 ○円"),
                ],)
              ),
          ),
        ],)
    );
  }
}
