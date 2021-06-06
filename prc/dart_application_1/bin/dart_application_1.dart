import 'dart:ffi';

import 'package:dart_application_1/dart_application_1.dart'
    as dart_application_1;

class Person {
  late String name;
  late int age;
  late num aa;

  Person({int age1 = 10, String name1 = 'jykim1', num aa = 19.1}) {
    age = age1;
    name = name1;
  }

  void eat() {
    print('eating');
  }
}

class Human extends Person {
  Human({int age1 = 10, num a = 10}) {
    age = age1;
    aa = a;
  }
  @override
  Person eat() {
    super.eat();
    print('digesting');
    return Human();
  }
}

void main() {
  Person? jykim = Person(age1: 10, name1: 'jykim', aa: 10);
  jykim.name = 'jykim';
  jykim.age = 10;
  print('${jykim.age}');

  Human juu = Human();
  juu.eat();
}
