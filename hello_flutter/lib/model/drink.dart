class DrinkList {
  final List<Drink>? drinks;

  DrinkList({
    required this.drinks,
  });

  factory DrinkList.fromJson(dynamic json) {
    var drinkObjectsJson = json["drinks"] as List;
    List<Drink> drinks =
        drinkObjectsJson.map((drinkJson) => Drink.fromJson(drinkJson)).toList();
    return DrinkList(
      drinks: drinks,
    );
  }
}

class Drink {
  final String strDrink;
  final String strDrinkThumb;
  final String idDrink;
  final String? strInstructions;

  Drink({
    required this.strDrink,
    required this.strDrinkThumb,
    required this.idDrink,
    required this.strInstructions,
  });

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
      strDrink: json["strDrink"],
      strDrinkThumb: json["strDrinkThumb"],
      idDrink: json["idDrink"],
      strInstructions: json["strInstructions"],
    );
  }
}
