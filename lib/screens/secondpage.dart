import 'package:flutter/material.dart';
import '../models/Recipeview.dart';

// ignore: must_be_immutable
class Searchresult extends StatefulWidget {
  Searchresult({Key? key, this.recipedetail, this.listofSteps})
      : super(key: key);

  Recipe? recipedetail;
  RecipeSteps? listofSteps;

  @override
  _SearchresultState createState() => _SearchresultState();
}

class _SearchresultState extends State<Searchresult> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 35.0, bottom: 15, left: 8, right: 8),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: widget.recipedetail!.title.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Merienda_One',
                        fontWeight: FontWeight.w300,
                        color: Colors.red.shade200),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 250,
                  width: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage(widget.recipedetail!.image.toString()),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Ready in Minutes: ',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Merienda_One',
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.recipedetail!.readyInMinutes.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Merienda_One',
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                for (var i in widget.listofSteps!.stepslist!)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                        text: TextSpan(
                            text: 'Step ${i.number}: ',
                            style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Merienda_One',
                                color: Colors.white),
                            children: <TextSpan>[
                          TextSpan(
                            text: i.step!,
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Merienda_One',
                                color: Colors.white),
                          ),
                          TextSpan(text: '\n')
                        ])),
                  ),
              ],
            ),
          ),
        ));
  }
}
