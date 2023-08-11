
import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';


void main() {
  TorchController().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false   ,
      title: 'FlashLight',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const TorchLight(),
    );
  }

}


class TorchLight extends StatefulWidget {
  const TorchLight({super.key});

  @override
  State<TorchLight> createState() => _TorchLightState();
}

class _TorchLightState extends State<TorchLight> {

  var isActive = false;
  var controller = TorchController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0.0,
        title: Text("Flashlight", style: TextStyle(color: Colors.greenAccent, fontSize:30 ),),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment : MainAxisAlignment.center,
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(left: 70, right: 70),
                        child: Container(
                          child: Text("Flashlight" ,
                            style: TextStyle(color: isActive ? Colors.white : Colors.white70,
                                fontSize:35,
                                fontWeight: FontWeight.w600),),
                        ),
                      ),

                      SizedBox(
                        height:25 ,
                      ),

                      ElevatedButton(
                          onPressed: (){
                            controller.toggle();
                            isActive = !isActive;
                            setState(() {});
                          },
                          child: Text(isActive ? 'ON' : 'OFF',
                              style: TextStyle(fontSize:25,fontWeight : FontWeight.w500)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            padding: EdgeInsets.only(left: 20 ,right: 20),
                          )

                      ),


                      SizedBox(
                        height: 130,
                      )

                    ],
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}




