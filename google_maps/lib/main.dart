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
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  Container MyArticles(String imageVal, String heading, String subHeading){
    return   Container(
                height: 200,
                width: 200,
                child: Card( color: Colors.white,
                  child: Wrap(
                    children: <Widget>[
                      Image.network(imageVal, height: 260, width: 260,),
                      ListTile(
                        title: Text(heading),
                        subtitle: Text(subHeading),
                      ),
                    ],
                  ),
                ),
              );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        image: DecorationImage(
        image: NetworkImage('https://afremov.com/var/images/product/1200.1200/LIGHT-OF-AUTUMN.jpg'),
        
          ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Bienvenidos al Museo de Lima'
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 25.0),
            height: 350, 
            width: 400,         
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                MyArticles("https://artelista.s3.amazonaws.com/obras/big/0/9/1/1134895-5f1b52cdd542d.jpg", "heading1", "subHeading1"),
                MyArticles("https://i.pinimg.com/236x/80/75/a9/8075a9bba442ca8f50e4ac95912349a3.jpg", "heading1", "subHeading1"),
                MyArticles("https://i.pinimg.com/564x/2f/cf/13/2fcf139b8541dbbb8d8c8ccd49b6fbf3.jpg", "heading1", "subHeading1"),
                MyArticles("https://image.dhgate.com/0x0s/f2-albu-g8-M01-C0-47-rBVaVF5SiCuAelS6AAjuYT4ezpk048.jpg/24x36inch-sena-franco-arte-de-la-pintura.jpg", "heading1", "subHeading1"),
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

