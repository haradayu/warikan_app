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
  int totalFee = 0;
  var rateList = [1.0, 1.0];
  var numberList = [0, 0];
  var feePerPersonList = [0,0];

  void onChangedTatalFee(String value){
    setState(() {
      totalFee = int.parse(value);
      calucurateFeePerPerson();
    });
  }

  void onChangedRate(String value, int index){
    setState(() {
      rateList[index] = double.parse(value);
      calucurateFeePerPerson();
    });
  }
  void onChangedNumber(String value, int index){
    setState(() {
      numberList[index] = int.parse(value);
      calucurateFeePerPerson();
    });
  }
  void calucurateFeePerPerson(){
    double totalNumber = 0.0;
    for (int i=0;i < rateList.length; i++){
      totalNumber += numberList[i] * rateList[i];
    }

    double feePerPerson = totalFee / totalNumber;
    for(int i=0;i<rateList.length;i++){
      feePerPersonList[i] = (feePerPerson * rateList[i]).ceil();
    }
  }

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
                  TextField(
                    onChanged: onChangedTatalFee,
                    keyboardType: TextInputType.number),
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
                  TextField(
                    onChanged: (value){
                      onChangedRate(value, 0);
                    },
                    keyboardType: TextInputType.number),
                ),
                Text("倍"),
                Flexible(child:
                  TextField(
                    onChanged: (value){
                      onChangedNumber(value, 0);
                    },
                    keyboardType: TextInputType.number),
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
                    TextField(
                      onChanged: (value){
                        onChangedRate(value, 1);
                      },
                      keyboardType: TextInputType.number),
                  ),
                  Text("倍"),
                  Flexible(child:
                    TextField(
                      onChanged: (value){
                        onChangedNumber(value, 1);
                      },
                      keyboardType: TextInputType.number),
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
                  Text("${rateList[0]}倍の人 ${feePerPersonList[0]}"),
                  Text("${rateList[1]}倍の人 ${feePerPersonList[1]}円"),
                ],)
              ),
          ),
        ],)
    );
  }
}
