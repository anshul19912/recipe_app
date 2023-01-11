import "package:flutter/material.dart";
import 'package:recipe_app/screens/firstpage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/263d53ed14ea33255b11d342a25c20d4.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Foodie Recipes",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Pacifico",
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.w200,
                  fontSize: 38),
            ),
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirstPage()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.black87,
              ),
              height: 50,
              width: 150,
              child: Center(
                child: Text("Explore",
                    style: TextStyle(
                        fontFamily: "Merienda_One",
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
