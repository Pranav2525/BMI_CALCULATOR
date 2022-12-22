import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var ftcontroller=TextEditingController();
  var inchcontroller=TextEditingController();
  var wtcontroller=TextEditingController();
  var result="";
  var bgcolour=Colors.blue.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body:Container(
        color:bgcolour,
        child: Center(
          child: Container(
            width:300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text('BMI',style: TextStyle(
                        fontSize: 36, fontWeight: FontWeight.w700
                    ),),
                    SizedBox(
                        height:11
                    ),
                    TextField(
                      controller: ftcontroller,
                      decoration: InputDecoration(
                          label: Text('Enter Your Height(in Ft)'),
                          prefixIcon: Icon(Icons.height)
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                        height:11
                    ),
                    TextField(
                      controller: inchcontroller,
                      decoration: InputDecoration(
                          label: Text('Enter Your Height(in Inch)'),
                          prefixIcon: Icon(Icons.height)
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                        height:11
                    ),
                    TextField(
                      controller: wtcontroller,
                      decoration: InputDecoration(
                          label: Text('Enter Your Weight(in Kgs)'),
                          prefixIcon: Icon(Icons.line_weight)
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                        height:21
                    ),
                    ElevatedButton(onPressed: (){
                      var ft=ftcontroller.text.toString();
                      var inch=inchcontroller.text.toString();
                      var wt=wtcontroller.text.toString();

                      if(ft!="" && inch!="" && wt!="")
                      {
                        var intft=int.parse(ft);
                        var intinch=int.parse(inch);
                        var intwt=int.parse(wt);

                        var totalinch=(intft*12)+intinch;
                        var totatlcm=2.54*totalinch;
                        var totalm=totatlcm/100;
                        var bmi=intwt/(totalm*totalm);
                        var msg="";
                        if(bmi<18)
                        {
                          msg="You're Under Weight!!";
                          bgcolour=Colors.yellow.shade200;
                          result="  Your BMI is: ${bmi.toStringAsFixed(2)}\n$msg";
                        }
                        else if(bmi>=18 && bmi<=25)
                        {
                          msg="You're Healthy!!";
                          bgcolour=Colors.green.shade200;
                          result="Your BMI is: ${bmi.toStringAsFixed(2)}\n  $msg";
                        }
                        else{
                          msg="You're Over Weight!!";
                          bgcolour=Colors.red.shade200;
                          result=" Your BMI is: ${bmi.toStringAsFixed(2)}\n$msg";
                        }
                        setState(() {

                        });
                      }
                      else
                      {
                        setState(() {
                          result= "Please fill all the required details!!";
                        });
                      }
                    }, child:Text('Calculate BMI')),
                    SizedBox(height: 21,),
                    Text(result, style: TextStyle(fontSize:19)),
                  ],
                ),
                SizedBox(height:54),
                Text("Developed By Pranav Garg",style: TextStyle(color: Colors.black45),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
