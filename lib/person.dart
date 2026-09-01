library person_library;

part 'greeting_person.dart';

class Person {
  final String _firstName;
  final String _lastName;

  Person(this._firstName, this._lastName);

  String greet() => 'Hello, $_firstName $_lastName!';
}