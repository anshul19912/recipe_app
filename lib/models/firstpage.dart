import "package:flutter/material.dart";
import 'package:recipe_app/models/home.dart';

class Firstpage extends StatefulWidget {
  Firstpage({Key? key}) : super(key: key);

  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'lib/models/images/263d53ed14ea33255b11d342a25c20d4.jpg',
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
                MaterialPageRoute(builder: (context) => Home()),
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
