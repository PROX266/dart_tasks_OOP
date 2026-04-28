import 'dart:io';

//1. Реализуйте класс «Кружка» и «Человек». Дайте возможность
//человеку пить из кружки.
class Human {
  String name;

  Human(this.name);
}

class Cup extends Human {
  String color;
  int volume; //мл
  String drink;

  Cup(this.color, this.volume, this.drink, super.name);

  void drinking() {
    print("$name пьёт $drink из $color кружки объёмом $volume");
  }
}

//2. Реализуйте класс «Шкаф», в состав которого входит несколько
//систем хранения. У пользователя должна быть возможность
//поместить вещи в шкаф и забрать их оттуда.
class Closet {
  Map<String, String> topShelf = {
    "Кепка": "Кепка",
    "Шапка": "Шапка",
    "Шарф": "Шарф",
  };
  Map<String, String> clothingHanger = {
    "Пальто": "Пальто",
    "Куртка": "Куртка",
    "Шуба": "Шуба",
  };
  Map<String, String> bottomShelf = {
    "Зимние ботинки": "Зимние ботинки",
    "Кеды": "Кеды",
    "Кроссовки": "Кроссовки",
  };

  Map<String, String> userClothing = {};

  String? takenFromTop(String itemName) {
    if (topShelf.containsKey(itemName)) {
      topShelf.remove(itemName);
      userClothing[itemName] = "Взято из шкафа";
      return "Пользователь взял ${itemName}";
    }
    return "Этого предмета нет в шкафу";
  }

  String? takenFromHanger(String itemName) {
    if (clothingHanger.containsKey(itemName)) {
      clothingHanger.remove(itemName);
      userClothing[itemName] = "Взято из шкафа";
      return "Пользователь взял ${itemName}";
    }
    return "Этого предмета нет в шкафу";
  }

  String? takenFromBottom(String itemName) {
    if (bottomShelf.containsKey(itemName)) {
      bottomShelf.remove(itemName);
      userClothing[itemName] = "Взято из шкафа";
      return "Пользователь взял ${itemName}";
    }
    return "Этого предмета нет в шкафу";
  }

  String placeToCloset(String itemName) {
    if (userClothing.containsKey(itemName)) {
      userClothing.remove(itemName);

      print("На какую полку положить предмет?(Верхняя, вешалка, нижняя)");
      String? input = stdin.readLineSync()!.toLowerCase();

      switch (input) {
        case "верхняя":
          topShelf[itemName] = itemName;
          return "Пользователь положил $itemName на верхнюю полку";
        case "вешалка":
          clothingHanger[itemName] = itemName;
          return "Пользователь повесил $itemName";
        case "нижняя":
          bottomShelf[itemName] = itemName;
          return "Пользователь положил $itemName  на нижнию полку";
      }
    }
    return "Такого предмета нет";
  }
}

void main() {
  var cup = Cup("Красной", 250, "чай", "Олег");
  cup.drinking();

  var myCloset = Closet();

  String? closetTop = myCloset.takenFromTop("Кепка");
  print(closetTop);

  String? closetHanger = myCloset.takenFromHanger("Пальто");
  print(closetHanger);

  String? closetBottom = myCloset.takenFromBottom("Кеды");
  print(closetBottom);

  print(myCloset.userClothing);

  print(myCloset.placeToCloset("Кепка"));
  print(myCloset.userClothing);
}
