import 'package:flutter/material.dart';
import 'package:google_maps/screens/google_maps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
        image: NetworkImage('https://elperuano.pe/suplementosflipping/lonuestro/263/web/img/foto03.jpg')
        //image: AssetImage('assets/dorado.jpg')
          ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          
          title: Text('Bienvenidos al Museo de Lima'
          ),
        ),
        body: Center(        
          child: Column(         
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                '',
                style: TextStyle(
                height: 15,
                color: Colors.pink,
                fontSize: 34,
                fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=> Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context)=> AppGoogleMaps(),
          ),
          ),
          tooltip: 'Google Maps',
          child: const Icon(Icons.pin_drop_outlined),
        ),
      ),
    );
  }
}

