class Recipe {
  int? id;
  String? title;
  String? image;
  int? readyInMinutes;
  bool? vegetarian;
  int? healthScore;

  Recipe(
      // constructor
      {this.id,
      this.title,
      this.image,
      this.readyInMinutes,
      this.vegetarian,
      this.healthScore});

  factory Recipe.fromMap(Map<String, dynamic> map) {
    //use for fetching values from API
    return Recipe(
        id: map['id'], //the names inside map must be same as in the api
        title: map['title'],
        image: map['image'],
        readyInMinutes: map['readyInMinutes'],
        vegetarian: map['vegetarian'],
        healthScore: map['healthScore']);
  }
}



class ListofRecipe {
  // Use for creating list of recipes
  List<Recipe>? recipelist; //list<variable type>  variable name

  ListofRecipe({this.recipelist}); // constructor

  factory ListofRecipe.fromMap(Map<String, dynamic> map) {
    return ListofRecipe(recipelist: generatelist(map));
  }
}

List<Recipe> generatelist(Map<String, dynamic> map) {
  //this will return list of recipes to the recipelist (line-37)

  List<Recipe> emptylist = [];
  for (var item in map['results']) {
    Recipe recipepicker =
        Recipe.fromMap(item); //generate Recipe object as  recipepicker
    emptylist.add(recipepicker);
  }

  return emptylist;
}
