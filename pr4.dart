import 'dart:math';

// 1. Класс кружка и человек
class Cup {
  double volume;
  Cup(this.volume);

  void beDrunk(double amount) {
    if (amount <= volume) {
      volume -= amount;
      print('Из кружки отпито $amount мл. Осталось: $volume мл.');
    } else {
      print('В кружке нет столько жидкости!');
    }
  }
}

class Person {
  String name;
  Person(this.name);

  void drinkFrom(Cup cup, double amount) {
    print('$name берет кружку и пьет...');
    cup.beDrunk(amount);
  }
}

// 2. система хранения
class Wardrobe {
  List<String> items = [];

  void putItem(String item) {
    items.add(item);
    print('$item теперь в шкафу.');
  }

  void takeItem(String item) {
    if (items.contains(item)) {
      items.remove(item);
      print('$item извлечен из шкафа.');
    } else {
      print('Предмета $item нет в шкафу.');
    }
  }
}

// 3. Классы гриф и блин
class Plate {
  double weight;
  Plate(this.weight);
}

class BarbellBar {
  double maxCapacity;
  double currentWeight = 0;
  List<Plate> leftPlates = [];
  List<Plate> rightPlates = [];

  BarbellBar(this.maxCapacity);

  void addPlate(Plate plate, String side) {
    if (currentWeight + plate.weight > maxCapacity) {
      print('Превышен максимальный вес! Нельзя добавить ${plate.weight} кг.');
      return;
    }

    if (side == 'лево') {
      leftPlates.add(plate);
    } else {
      rightPlates.add(plate);
    }
    currentWeight += plate.weight;
    print('Блин ${plate.weight} кг добавлен на $side сторону. Общий вес: $currentWeight кг.');
  }
}

// 4. Конвертер калют
class CurrencyConverter {
  static double usdToRub = 92.5;

  double toRub(double usd) => usd * usdToRub;
  double toUsd(double rub) => rub / usdToRub;
}

// 6. Перегрузка
class MyNumber {
  double value;
  MyNumber(this.value);

  MyNumber operator +(MyNumber other) => MyNumber(this.value + other.value);
  MyNumber operator -(MyNumber other) => MyNumber(this.value - other.value);
  MyNumber operator *(MyNumber other) => MyNumber(this.value * other.value);
  MyNumber operator /(MyNumber other) => MyNumber(this.value / other.value);

  @override
  String toString() => value.toString();
}

// 7. Класс автомобиль и перечисление
enum CarStatus { stop, drive, turn }

class Car {
  CarStatus status = CarStatus.stop;

  void updateStatus(CarStatus newStatus) {
    status = newStatus;
    print('Автомобиль сменил состояние на: $status');
  }
}

// 8. Наследование от геометрических фигур
abstract class Shape {
  double calculateArea();
}

class Rectangle extends Shape {
  double w, h;
  Rectangle(this.w, this.h);
  @override
  double calculateArea() => w * h;
}

class MyCircle extends Shape {
  double radius;
  MyCircle(this.radius);
  @override
  double calculateArea() => pi * radius * radius;
}

class Triangle extends Shape {
  double base, height;
  Triangle(this.base, this.height);
  @override
  double calculateArea() => 0.5 * base * height;
}

// 9. Системы счисления
class BaseConverter {
  String fromDecimal(int val, int radix) => val.toRadixString(radix);

  int toDecimal(String val, int radix) => int.parse(val, radix: radix);
}

// 10. Список фигур и макс. площадь
class ShapeList {
  List<Shape> list = [];

  void add(Shape s) => list.add(s);

  Shape findMax() {
    Shape maxShape = list[0];
    for (var s in list) {
      if (s.calculateArea() > maxShape.calculateArea()) {
        maxShape = s;
      }
    }
    return maxShape;
  }
}

void main() {
  print("Задание 1");
  var cup = Cup(300);
  var person = Person('Алексей');
  person.drinkFrom(cup, 100);

  print("\nЗадание 2");
  var wd = Wardrobe();
  wd.putItem('Куртка');
  wd.takeItem('Куртка');

  print("\nЗадание 3");
  var bar = BarbellBar(100);
  bar.addPlate(Plate(20), 'лево');
  bar.addPlate(Plate(20), 'право');

  print("\nЗадание 4");
  var conv = CurrencyConverter();
  print("10 USD в RUB: ${conv.toRub(10)}");

  print('\n--- Задание 6 ---');
  var n1 = MyNumber(10);
  var n2 = MyNumber(2);
  print("Сложение: ${n1 + n2}");
  print("Деление: ${n1 / n2}");

  print("\nЗадание 7");
  var myCar = Car();
  myCar.updateStatus(CarStatus.drive);

  print("\nЗадание 8 & 10");
  var sl = ShapeList();
  sl.add(Rectangle(5, 10)); // 50
  sl.add(MyCircle(3)); // ~28.2
  print('Максимальная площадь: ${sl.findMax().calculateArea()}');

  print("\nЗадание 9");
  var bc = BaseConverter();
  print('255 в 16-ричную: ${bc.fromDecimal(255, 16)}');
}
