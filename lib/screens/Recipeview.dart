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
  for (var item in map['results'] ?? []) {
    Recipe recipepicker =
        Recipe.fromMap(item); //generate Recipe object as  recipepicker
    emptylist.add(recipepicker);
  }

  return emptylist;
}

// For Recipe Steps

class Steps {
  int? number;
  String? step;

  Steps(
      { //constructor
      this.number,
      this.step});

  factory Steps.fromMap(Map<String, dynamic> map) {
    return Steps(number: map['number'], step: map['step']);
  }
}

class RecipeSteps {
  List<Steps>? stepslist; // we make List variabl as 'stepslist'

  RecipeSteps({this.stepslist});

  factory RecipeSteps.fromMap(Map<String, dynamic> map) {
    return RecipeSteps(stepslist: generatesteplist(map));
  }
}

List<Steps> generatesteplist(Map<String, dynamic> map) {
  // we are making function of generatesteplist

  // ignore: non_constant_identifier_names
  List<Steps> Blanklist = [];

  for (var item in map['steps']) {
    // we are looping variable item in steps:   we are saving diffent items in steps
    // ignore: non_constant_identifier_names
    Steps STEP = Steps.fromMap(
        item); // we are storing value of number and step in the variable 'STEP' one by one taken from the factory 'Steps.fromMap' (lines no.65-67)
    Blanklist.add(STEP);
  }
  return Blanklist;
}
