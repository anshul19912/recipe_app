import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:recipe_app/screens/Recipeview.dart';

Future<ListofRecipe> fetchinglist(String recipename) async {
  var url = Uri.parse(
      'https://api.spoonacular.com/recipes/complexSearch?apiKey=3b4805aac32f4bd1803f563e1cdf0c8d&query=$recipename&number=20');
  http.Response response = await http.get(url);
  log(response.body);
  return ListofRecipe.fromMap(json.decode(response.body));
}

Future<Recipe> fetchinginformation(int id) async {
  var url = Uri.parse(
      'https://api.spoonacular.com/recipes/$id/information?includeNutrition=false&apiKey=3b4805aac32f4bd1803f563e1cdf0c8d');
  http.Response response = await http.get(url);

  return Recipe.fromMap(json.decode(response.body));
}

Future<RecipeSteps> fetchingsteps(int id) async {
  var url = Uri.parse(
      'https://api.spoonacular.com/recipes/$id/analyzedInstructions?apiKey=3b4805aac32f4bd1803f563e1cdf0c8d');
  http.Response response = await http.get(url);

  return RecipeSteps.fromMap(json.decode(response.body)[0]);
}
