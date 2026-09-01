# SWE 463 - Dart Lab 02
**Name:** Naif Alenizi

## Task 2 — Variable Modifiers

**1. What is the difference between `final` and `const`?**

Both prevent reassigning a value after initialization. The difference is that
`const` must be known at compile-time — its value is fixed before the program
even runs. `final`, on the other hand, can be assigned a value at runtime
(e.g. computed from a function or based on input) — but once assigned, it
cannot be changed.

**2. Why can `dynamic` change from `String` to `int`?**

Because `dynamic` disables compile-time type checking, so the variable can
hold any data type and change its type freely during program execution,
unlike explicit types (like `String` or `int`) which lock the variable to one
fixed type for its lifetime.

---

## Task 4.1 — Collections (List, Map, Set)

**Explain why the duplicate set item is not stored twice.**

A `Set` is by nature a collection of unique elements — it does not allow
duplicate values. When you add an item that already exists in the Set, Dart
automatically ignores the duplicate addition and keeps only one copy of each
value.

---

## Task 4.2 — Dynamic List Building

**Explain what the spread operator `...` does.**

The spread operator `...` takes all the elements of another list and inserts
them directly as individual elements into the current list, instead of
nesting them as a single sublist. So `...fruitsList` unpacks the elements of
`fruitsList` and merges them at the same level as the rest of `allFruits`.

---

## Task 6.1 — Private Members Across Files

**Screenshot evidence:** see `screenshots/task6_privacy.png`

Uncommenting `print(person._firstName);` produced the following compile-time
error:

Error: The getter '_firstName' isn't defined for the class 'Person'.


This confirms that `_firstName` is private to `person.dart`'s library and
cannot be accessed from `main.dart`.

---

## Task 6.2 — `part` and `part of`

**Explain why `GreetingPerson` can access `_firstName` and `_lastName` even
though they start with `_`.**

In Dart, privacy operates at the **library level**, not the class level.
Since `GreetingPerson` is defined in `greeting_person.dart`, which uses
`part of person_library`, it is officially considered **part of the same
library** (`person_library`) as `Person` and its private fields
`_firstName`/`_lastName`. Private members are visible to any code within the
same library, even if that code lives in a different physical file, so
`GreetingPerson` can access them directly.

---

## Task 8.1 — Future, async, await

**Write the order in which [1] through [6] were printed.**

Order: **[1] → [2] → [3] → [4] → [5] → [6]**

The first `await fetchData()` call (leading to [3]) is truly synchronous in
flow — the program waits for it to complete before continuing. However, the
second `fetchData().then(...)` call does NOT use `await`, so it is
**asynchronous** — the program does not wait for it and immediately proceeds
to print [5]. Only after the delayed Future actually completes (2 seconds
later) does [6] get printed. This demonstrates the difference between
`await` (blocks and waits) and `.then()` (registers a callback that runs
later, without blocking the main flow).

---

## Task 9 — Final Exercise: Dart Feature Table

| Dart feature | Line number(s) |
|---|---|
| Variables and types | 26, 27 |
| Null safety | 27 |
| Function definitions | 9, 22, 29, 37 |
| Collections | 45 |
| Class definitions | 5, 16, 25 |
| Generics | 22, 25 |
| Positional parameter definitions | — |
| Named parameter definitions | 6, 17 |
| Private members | 25, 29 |
| Importing packages | 1 |
| Inheritance | 5, 16, 25 |ِ