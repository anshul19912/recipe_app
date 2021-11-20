import 'package:flutter/material.dart';
import 'package:recipe_app/models/Recipeview.dart';
import 'package:recipe_app/services/fetching.dart';

class Recipetile extends StatefulWidget {
  Recipetile(
      {Key? key,
      this.title,
      this.readyInMinutes,
      this.vegetarian,
      this.healthScore,
      this.id,
      this.image})
      : super(key: key);
  int? id;
  String? title;
  String? image;
  int? readyInMinutes;
  bool? vegetarian;
  int? healthScore;
  @override
  _RecipetileState createState() => _RecipetileState();
}

class _RecipetileState extends State<Recipetile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            widget.title!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Image.network(widget.image!),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchvalue = TextEditingController();

  List<Widget> searchresult = [];

  void searchfunction() async {
    ListofRecipe RECIPES;
    RECIPES = await fetchinglist(searchvalue.text);

    setState(() {
      searchresult.clear();
      for (Recipe item in RECIPES.recipelist ?? []) {
        searchresult.add(Recipetile(
            title: item.title,
            image: item.image,
            id: item.id,
            readyInMinutes: item.readyInMinutes,
            vegetarian: item.vegetarian,
            healthScore: item.healthScore));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(0, 0, 0, 1),
                  Color.fromRGBO(67, 67, 67, 1),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Text(
                    "Foodie Recipes",
                    style: TextStyle(color: Colors.yellow, fontSize: 25),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Want to Cook Something?",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "We are here to help you. Search for any Recipe you want to make",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchvalue,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Type here",
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            searchfunction();
                          },
                          child: Container(
                            child: Icon(Icons.search, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(child: Column(children: searchresult)),
        ],
      ),
    ));
  }
}
