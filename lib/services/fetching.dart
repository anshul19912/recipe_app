import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:recipe_app/models/Recipeview.dart';

Future<ListofRecipe> fetchinglist(String recipename) async {
  var url = Uri.parse(
      'https://api.spoonacular.com/recipes/complexSearch?apiKey=9fd606f3ce204345a559c27f5dd7fdcc&query=$recipename&number=20');
  http.Response response = await http.get(url);

  return ListofRecipe.fromMap(json.decode(response.body));
}

