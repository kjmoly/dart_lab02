part of person_library;

class GreetingPerson extends Person {
  GreetingPerson(super.firstName, super.lastName);

  void sayHi() {
    print('Hi $_firstName $_lastName');
  }
}