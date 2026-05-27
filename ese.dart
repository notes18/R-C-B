

// ───────────────────────────────────────────────────────────────────
//  SECTION 1 — VARIABLES & DATA TYPES  (Interview Favourite)
// ───────────────────────────────────────────────────────────────────

void section1_variablesAndTypes() {
  print("\n══════════ SECTION 1: Variables & Data Types ══════════");

  // var  → type inferred at compile time, cannot change type later
  var name = "Alice";        // inferred as String
  // name = 42;             // ← COMPILE ERROR: can't assign int to String

  // dynamic → type can change at runtime (use sparingly)
  dynamic flex = "hello";
  flex = 99;                 // valid — dynamic allows type change
  print("dynamic: $flex");

  // final → set once at runtime
  final int score = 100;
  // score = 200;           // ← COMPILE ERROR

  // const → compile-time constant; must be known before execution
  const double pi = 3.14159;
  print("pi = $pi");

  // late → delayed initialization (assigned before first use)
  late String lazyValue;
  lazyValue = "Initialized now";
  print("late: $lazyValue");

  // ── Type Conversions ────────────────────────────────────────────
  int a     = int.parse("42");           // String → int
  double d  = double.parse("3.14");      // String → double
  String s  = 42.toString();            // int    → String
  int trunc = 3.9.toInt();              // double → int  (truncates, not rounds)
  print("parse: $a  $d  $s  trunc=$trunc");

  // ── Strings ────────────────────────────────────────────────────
  String raw = r"No \n escape here";    // raw string
  String multi = """
Line 1
Line 2""";                              // multi-line string
  print(raw);

  // ── Collections ────────────────────────────────────────────────
  List<int>        list    = [1, 2, 3];
  Set<String>      unique  = {"a", "b", "a"};   // → {"a","b"}
  Map<String, int> map     = {"x": 10, "y": 20};

  list.add(4);
  unique.add("c");
  map["z"] = 30;

  print("List: $list  Set: $unique  Map: $map");

  // ── EDGE CASE: integer division ─────────────────────────────────
  print("7 ~/ 2 = ${7 ~/ 2}");   // integer division  → 3
  print("7 /  2 = ${7 / 2}");    // always double      → 3.5
}


// ───────────────────────────────────────────────────────────────────
//  SECTION 2 — NULL SAFETY  (Most Common Exam/Interview Topic)
// ───────────────────────────────────────────────────────────────────

void section2_nullSafety() {
  print("\n══════════ SECTION 2: Null Safety ══════════");

  // Nullable vs Non-nullable
  int  nonNull = 5;    // cannot be null
  int? nullable = null; // can be null

  // ── Null-aware operators ────────────────────────────────────────

  // ??  (null coalescing) — provides default if null
  String? username;
  print(username ?? "Guest");          // prints "Guest"

  // ??= (null-aware assignment) — assign only if currently null
  username ??= "DefaultUser";
  print(username);                      // prints "DefaultUser"

  // ?.  (null-safe member access)
  String? city;
  print(city?.length);                  // prints null, no crash

  // !   (null assertion) — force unwrap; throws if actually null
  String? confirmed = "Delhi";
  print(confirmed!.length);            // safe here — we know it's not null

  // ── late and lazy init ──────────────────────────────────────────
  late int computed;
  bool condition = true;
  if (condition) computed = 42;
  print("late computed: $computed");

  // ── Your Assignment Q1 — fixed & explained ─────────────────────
  List<int?> nums = [-3, 12, null, 5, -2, 20, 16, null, 8];
  print("Q1 safeSquareSum: ${safeSquareSum(nums)}");
  // Expected: 9+144+1+25+4+400+256+1+64 = 904

  // ── EDGE CASES ──────────────────────────────────────────────────
  List<int?> allNulls = [null, null, null];
  print("All nulls sum: ${safeSquareSum(allNulls)}");  // 3

  List<int?> noNulls  = [2, 3];
  print("No nulls sum:  ${safeSquareSum(noNulls)}");   // 4+9=13
}

// Fixed Q1 — null safety, no bugs
int safeSquareSum(List<int?> arr) {
  int sum = 0;
  for (int? val in arr) {
    sum += (val != null) ? val * val : 1;
  }
  return sum;
}


// ───────────────────────────────────────────────────────────────────
//  SECTION 3 — CONTROL FLOW: if/else, loops, switch
// ───────────────────────────────────────────────────────────────────

void section3_controlFlow() {
  print("\n══════════ SECTION 3: Control Flow ══════════");

  // ── if / else if / else ─────────────────────────────────────────
  int marks = 72;
  String grade;
  if      (marks >= 90) grade = "A+";
  else if (marks >= 75) grade = "A";
  else if (marks >= 60) grade = "B";
  else                   grade = "C";
  print("Grade: $grade");

  // ── Ternary ─────────────────────────────────────────────────────
  String status = marks >= 50 ? "Pass" : "Fail";
  print("Status: $status");

  // ── for loop ────────────────────────────────────────────────────
  for (int i = 0; i < 3; i++) print("for i=$i");

  // ── for-in loop (collection) ────────────────────────────────────
  for (var fruit in ["apple", "mango", "banana"]) print(fruit);

  // ── while ───────────────────────────────────────────────────────
  int n = 3;
  while (n > 0) { print("while n=$n"); n--; }

  // ── do-while (runs at least once) ───────────────────────────────
  int x = 0;
  do {
    print("do-while x=$x");
    x++;
  } while (x < 2);

  // ── switch / case — YOUR Q3 FIXED ───────────────────────────────
  print("calc 10+5 = ${calculator(10, 5, '+')}");
  print("calc 10/3 = ${calculator(10, 3, '/')}");
  print("calc invalid: ${calculator(5, 2, '%')}");

  // ── break & continue ────────────────────────────────────────────
  for (int i = 0; i < 5; i++) {
    if (i == 2) continue;  // skip 2
    if (i == 4) break;     // stop at 4
    print("loop i=$i");    // prints 0, 1, 3
  }

  // ── EDGE CASE: switch fall-through ──────────────────────────────
  // Dart does NOT allow implicit fall-through without break.
  // This would be a compile error:
  //   case 1: case 2: print("x");   ← illegal without break/return
  // You CAN stack empty cases (no body between them):
  int val = 2;
  switch (val) {
    case 1:
    case 2:
      print("val is 1 or 2");  // valid — empty case stacking
      break;
    default:
      print("other");
  }
}

// Fixed Q3 — added missing semicolons, default returns 0
num calculator(num a, num b, String op) {
  switch (op) {
    case '+': return a + b;
    case '-': return a - b;
    case '*': return a * b;
    case '/': return b != 0 ? a / b : double.infinity;  // guard div-by-zero!
    default:
      print("Invalid operator: $op");
      return 0;
  }
}


// ───────────────────────────────────────────────────────────────────
//  SECTION 4 — FUNCTIONS (All Flavours)
// ───────────────────────────────────────────────────────────────────

// ── Positional parameters ────────────────────────────────────────
int add(int a, int b) => a + b;

// ── Optional positional: [  ] ────────────────────────────────────
String greetOptional(String name, [String title = "Mr"]) => "Hello $title $name";

// ── Named parameters:  {  }  ─────────────────────────────────────
double bmi({required double weight, required double height}) =>
    weight / (height * height);

// ── Optional named with default ──────────────────────────────────
String tag(String text, {String style = "normal"}) => "[$style] $text";

// ── Higher-order function (takes a function) ─────────────────────
int applyTwice(int x, int Function(int) fn) => fn(fn(x));

// ── Anonymous / lambda ────────────────────────────────────────────
// (defined inline where used)

// ── Recursive ────────────────────────────────────────────────────
int factorial(int n) => (n <= 1) ? 1 : n * factorial(n - 1);

void section4_functions() {
  print("\n══════════ SECTION 4: Functions ══════════");

  print("add:         ${add(3, 4)}");
  print("greetOpt:    ${greetOptional("Alice")}");       // uses default
  print("greetOpt:    ${greetOptional("Bob", "Dr")}");
  print("bmi:         ${bmi(weight: 70, height: 1.75).toStringAsFixed(2)}");
  print("tag:         ${tag("headline")}");              // default style
  print("tag:         ${tag("warning", style: "bold")}");
  print("applyTwice:  ${applyTwice(2, (x) => x * 3)}"); // 2*3=6, 6*3=18
  print("factorial 5: ${factorial(5)}");

  // ── Arrow function inline ───────────────────────────────────────
  var square = (int x) => x * x;
  print("square 7:    ${square(7)}");

  // ── Closures (captures outer variable) ─────────────────────────
  int counter = 0;
  var increment = () => ++counter;
  increment(); increment();
  print("closure counter: $counter");   // 2

  // ── EDGE CASES ──────────────────────────────────────────────────
  // Functions are first-class objects in Dart
  Function fn = add;
  print("fn ref call: ${fn(10, 20)}");

  // Optional named can be null if not required:
  void printMaybe({String? msg}) => print(msg ?? "nothing");
  printMaybe();              // prints "nothing"
  printMaybe(msg: "hi");    // prints "hi"
}


// ───────────────────────────────────────────────────────────────────
//  SECTION 5 — CLASSES & OOP  (Biggest Interview Section)
// ───────────────────────────────────────────────────────────────────

// ── Base class ────────────────────────────────────────────────────
class Animal {
  String name;
  int    _age;           // private (underscore = library-private in Dart)

  // Constructor
  Animal(this.name, this._age);

  // Named constructor
  Animal.unknown() : name = "Unknown", _age = 0;

  // Getter
  int get age => _age;

  // Setter with validation
  set age(int val) {
    if (val < 0) throw ArgumentError("Age cannot be negative");
    _age = val;
  }

  // Method
  String speak() => "$name makes a sound";

  // toString override
  @override
  String toString() => "Animal($name, age=$_age)";
}

// ── Inheritance ───────────────────────────────────────────────────
class Dog extends Animal {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  // Method override
  @override
  String speak() => "$name barks! Breed: $breed";

  // Call parent method explicitly
  String fullSpeak() => "${super.speak()} & barks";
}

// ── Abstract class ────────────────────────────────────────────────
abstract class Shape {
  double area();              // must be implemented
  double perimeter();         // must be implemented
  void describe() => print("Shape area=${area().toStringAsFixed(2)}");
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);
  @override double area()      => 3.14159 * radius * radius;
  @override double perimeter() => 2 * 3.14159 * radius;
}

class Rectangle extends Shape {
  double w, h;
  Rectangle(this.w, this.h);
  @override double area()      => w * h;
  @override double perimeter() => 2 * (w + h);
}

// ── Interface (implements, not extends) ──────────────────────────
class Flyable {
  void fly() => print("Flying");
}

class Bird extends Animal implements Flyable {
  Bird(String name) : super(name, 1);
  @override String speak()  => "$name chirps";
  @override void   fly()    => print("$name is flying");
}

// ── YOUR Q6: VIPCustomer with Inheritance (Fixed) ─────────────────
class Customer {
  String name;
  int    id;
  int    age;
  String category;
  String city;
  Customer(this.name, this.id, this.age, this.category, this.city);
}

class VIPCustomer extends Customer {
  int discount;

  VIPCustomer(String name, int id, int age, String city, this.discount)
      : super(name, id, age, "VIP", city);

  String vipInfo() =>
      "VIP ${super.name} from ${super.city} gets $discount% off";
}

int vipDiscount() {
  VIPCustomer vp = VIPCustomer("Rahul", 101, 25, "Delhi", 30);
  return vp.discount;
}

void section5_oop() {
  print("\n══════════ SECTION 5: OOP ══════════");

  // ── Basic class usage ─────────────────────────────────────────
  Animal cat = Animal("Whiskers", 3);
  print(cat);
  print(cat.speak());

  Animal unknown = Animal.unknown();  // named constructor
  print(unknown);

  // ── Getter / Setter ───────────────────────────────────────────
  cat.age = 4;
  print("cat age after setter: ${cat.age}");
  try {
    cat.age = -1;   // will throw
  } catch (e) {
    print("Setter guard: $e");
  }

  // ── Inheritance ───────────────────────────────────────────────
  Dog dog = Dog("Rex", 5, "Labrador");
  print(dog.speak());
  print(dog.fullSpeak());

  // ── Polymorphism ──────────────────────────────────────────────
  List<Animal> zoo = [cat, dog, Bird("Tweety")];
  for (var animal in zoo) {
    print(animal.speak());  // runtime dispatch
  }

  // ── Abstract class ────────────────────────────────────────────
  Shape c = Circle(7);
  Shape r = Rectangle(4, 6);
  c.describe();
  r.describe();

  // ── Interface ─────────────────────────────────────────────────
  Bird bird = Bird("Eagle");
  bird.fly();

  // ── Q6 VIPCustomer ────────────────────────────────────────────
  VIPCustomer vip = VIPCustomer("Priya", 102, 30, "Mumbai", 40);
  print(vip.vipInfo());
  print("Q6 vipDiscount: ${vipDiscount()}");

  // ── EDGE CASES ────────────────────────────────────────────────
  // is  — type check
  print("dog is Animal: ${dog is Animal}");    // true (inheritance)
  print("cat is Dog:    ${cat is Dog}");       // false

  // as  — type cast (throws if wrong)
  Animal a2 = Dog("Buddy", 2, "Poodle");
  Dog d2 = a2 as Dog;                           // safe — it IS a Dog
  print("cast: ${d2.breed}");
}


// ───────────────────────────────────────────────────────────────────
//  SECTION 6 — MIXINS  (Your Q7 + Deep Dive)
// ───────────────────────────────────────────────────────────────────

mixin Greetable {
  String greet() => "Welcome, Customer!";
  void   wave()  => print("👋 Waving");
}

mixin Printable {
  void printInfo() => print("Printing info for: ${toString()}");
}

mixin Logger {
  List<String> _logs = [];
  void   log(String msg) { _logs.add(msg); print("LOG: $msg"); }
  List<String> get logs => List.unmodifiable(_logs);
}

// Mixin with on restriction — can only be used with Customer subclasses
mixin LoyaltyPoints on Customer {
  int points = 0;
  void earn(int p) { points += p; print("${name} earned $p pts. Total: $points"); }
}

class LoyalCustomer extends Customer with LoyaltyPoints, Logger {
  LoyalCustomer(String name, int id, int age)
      : super(name, id, age, "Loyal", "Delhi");
}

// ── Your Q7 mixin example ────────────────────────────────────────
mixin Greet { String greet() => "Welcome Customer"; }
class Demo with Greet {}
String mixinDemo() => Demo().greet();

void section6_mixins() {
  print("\n══════════ SECTION 6: Mixins ══════════");

  // ── Basic mixin ───────────────────────────────────────────────
  Demo d = Demo();
  print("Q7: ${d.greet()}");

  // ── Multiple mixins ───────────────────────────────────────────
  LoyalCustomer lc = LoyalCustomer("Sara", 201, 28);
  lc.log("Account created");
  lc.earn(100);
  lc.earn(50);
  print("All logs: ${lc.logs}");

  // ── EDGE CASES ────────────────────────────────────────────────
  // mixin vs abstract class:
  //   abstract class CAN have constructors; mixin CANNOT
  //   mixin uses 'with'; abstract class uses 'extends'
  //   a class can 'with' multiple mixins but 'extends' only one

  // mixin linearisation (MRO — Method Resolution Order)
  // If two mixins define the same method, the LAST one wins
  // (see Dart linearization spec)
}


// ───────────────────────────────────────────────────────────────────
//  SECTION 7 — SCOPE & CLOSURES
// ───────────────────────────────────────────────────────────────────

// Top-level variable
int globalCounter = 0;

void section7_scope() {
  print("\n══════════ SECTION 7: Scope ══════════");

  // Block scope
  {
    int local = 10;
    print("inside block: $local");
  }
  // print(local); // ← COMPILE ERROR: not in scope

  // Function scope
  int x = 5;         // local to this function
  print("local x: $x");

  globalCounter++;
  print("global: $globalCounter");

  // ── Closure ───────────────────────────────────────────────────
  Function makeCounter() {
    int count = 0;          // captured in closure
    return () {
      count++;
      return count;
    };
  }

  var c1 = makeCounter();
  var c2 = makeCounter();   // independent closure
  print("c1: ${c1()} ${c1()} ${c1()}");  // 1 2 3
  print("c2: ${c2()}");                  // 1 (independent)

  // ── Shadowing (allowed but careful) ───────────────────────────
  int score = 100;
  {
    // int score = 50;   // This would shadow outer score — legal in Dart
    // print(score);     // prints 50 (inner shadow)
  }
  print("outer score: $score");  // still 100

  // ── EDGE CASE: loop variable capture ──────────────────────────
  List<Function> funcs = [];
  for (int i = 0; i < 3; i++) {
    int captured = i;          // capture a copy
    funcs.add(() => captured);
  }
  print("captured: ${funcs.map((f) => f()).toList()}");  // [0, 1, 2]
  // Without 'int captured = i', all closures would share same i ref
}


// ───────────────────────────────────────────────────────────────────
//  SECTION 8 — ASYNC / AWAIT / FUTURE / STREAM
// ───────────────────────────────────────────────────────────────────

// ── Basic Future ─────────────────────────────────────────────────
Future<String> fetchUserName(int id) async {
  await Future.delayed(Duration(milliseconds: 100));  // simulate network
  if (id <= 0) throw ArgumentError("Invalid ID");
  return "User_$id";
}

// ── Future.value / Future.error ──────────────────────────────────
Future<int> immediateValue() => Future.value(42);
Future<int> immediateError() => Future.error("Something went wrong");

// ── Your Q9 analyzeNumbers (FIXED for nullable list) ─────────────
Future<String> analyzeNumbers(List<int?> arr) async {
  // Filter nulls before computing
  List<int> valid = arr.whereType<int>().toList();
  if (valid.isEmpty) return Future.delayed(
    Duration(seconds: 0), () => "Empty Dataset");
  double avg = valid.reduce((a, b) => a + b) / valid.length;
  return Future.delayed(
    Duration(seconds: 0),   // 0 for demo speed; use 2 for real
    () => avg > 10 ? "Good Dataset" : "Small Dataset",
  );
}

// ── Your Q10 reportDataset ────────────────────────────────────────
Future<void> reportDataset(List<int?> arr) async {
  String res = await analyzeNumbers(arr);
  print("Q10 report: ${res.toUpperCase()}");
}

// ── Chaining with .then().catchError().whenComplete() ─────────────
void chainedFuture() {
  fetchUserName(1)
      .then((name) => print("then: $name"))
      .catchError((e) => print("error: $e"))
      .whenComplete(() => print("always runs"));
}

// ── Future.wait — parallel execution ─────────────────────────────
Future<void> parallelFutures() async {
  var results = await Future.wait([
    fetchUserName(1),
    fetchUserName(2),
    fetchUserName(3),
  ]);
  print("parallel: $results");
}

// ── Stream — sequence of async values ────────────────────────────
Stream<int> countUp(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(milliseconds: 10));
    yield i;
  }
}

Future<void> section8_async() async {
  print("\n══════════ SECTION 8: Async/Await/Future/Stream ══════════");

  // Basic await
  String user = await fetchUserName(7);
  print("fetched: $user");

  // try/catch with async
  try {
    await fetchUserName(-1);
  } catch (e) {
    print("caught: $e");
  }

  // Immediate futures
  print("immediate value: ${await immediateValue()}");

  try {
    await immediateError();
  } catch (e) {
    print("immediate error: $e");
  }

  // Q9 & Q10
  List<int?> nums = [-3, 12, null, 5, -2, 20, 16, null, 8];
  print("Q9: ${await analyzeNumbers(nums)}");
  await reportDataset(nums);

  // Parallel
  await parallelFutures();

  // Stream
  await for (int val in countUp(5)) {
    process(val);
  }

  // Stream.listen alternative
  countUp(3).listen(
    (val) => print("stream listen: $val"),
    onDone: () => print("stream done"),
    onError: (e) => print("stream error: $e"),
  );
}

void process(int val) => print("stream yield: $val");


// ───────────────────────────────────────────────────────────────────
//  SECTION 9 — COLLECTIONS: List / Set / Map — Deep Dive
// ───────────────────────────────────────────────────────────────────

void section9_collections() {
  print("\n══════════ SECTION 9: Collections ══════════");

  // ── List ──────────────────────────────────────────────────────
  List<int> nums = [5, 3, 8, 1, 9, 2];

  nums.sort();
  print("sorted:   $nums");

  nums.sort((a, b) => b.compareTo(a));  // descending
  print("desc:     $nums");

  print("where>5:  ${nums.where((x) => x > 5).toList()}");
  print("map*2:    ${nums.map((x) => x * 2).toList()}");
  print("reduce+:  ${nums.reduce((acc, x) => acc + x)}");
  print("fold:     ${nums.fold(0, (acc, x) => acc + x)}");
  print("any>8:    ${nums.any((x) => x > 8)}");
  print("every>0:  ${nums.every((x) => x > 0)}");

  // Spread operator
  List<int> a = [1, 2];
  List<int> b = [3, 4];
  List<int> merged = [...a, ...b, 5];
  print("spread:   $merged");

  // ── Set ───────────────────────────────────────────────────────
  Set<int> s1 = {1, 2, 3, 4};
  Set<int> s2 = {3, 4, 5, 6};
  print("union:        ${s1.union(s2)}");
  print("intersection: ${s1.intersection(s2)}");
  print("difference:   ${s1.difference(s2)}");

  // ── Map ───────────────────────────────────────────────────────
  Map<String, int> scores = {"Alice": 90, "Bob": 75, "Carol": 88};

  // entries, keys, values
  scores.forEach((k, v) => print("$k → $v"));

  // putIfAbsent
  scores.putIfAbsent("Dave", () => 60);

  // update
  scores.update("Bob", (v) => v + 5);

  // map transform
  var doubled = scores.map((k, v) => MapEntry(k, v * 2));
  print("doubled: $doubled");

  // ── EDGE CASES ────────────────────────────────────────────────
  // Access missing key returns null (not error) for Map<K,V?>
  Map<String, int?> safe = {"a": 1};
  print("missing key: ${safe["z"]}");  // null

  // ConcurrentModificationError — can't modify list while iterating
  // for (var x in nums) { nums.remove(x); } // ← throws!
  // FIX: iterate a copy
  List<int> copy = List.from(nums);
  for (var x in copy) {
    if (x < 3) nums.remove(x);
  }
  print("after removal: $nums");
}


// ───────────────────────────────────────────────────────────────────
//  SECTION 10 — GENERICS  (Interview Sleeper Topic)
// ───────────────────────────────────────────────────────────────────

// Generic class
class Box<T> {
  T value;
  Box(this.value);
  T    getValue()      => value;
  void setValue(T val) => value = val;
  @override String toString() => "Box<${T}>(${value})";
}

// Generic function
T first<T>(List<T> list) {
  if (list.isEmpty) throw StateError("List is empty");
  return list.first;
}

// Bounded generics — T must be a num
T maxOf<T extends num>(T a, T b) => a > b ? a : b;

// Generic with multiple type params
class Pair<A, B> {
  A first;
  B second;
  Pair(this.first, this.second);
  @override String toString() => "($first, $second)";
}

void section10_generics() {
  print("\n══════════ SECTION 10: Generics ══════════");

  Box<int>    intBox = Box(42);
  Box<String> strBox = Box("hello");
  print(intBox);
  print(strBox);

  intBox.setValue(99);
  print("updated: $intBox");

  print("first: ${first([10, 20, 30])}");
  print("max:   ${maxOf(3.5, 7.2)}");

  Pair<String, int> p = Pair("age", 25);
  print("pair:  $p");

  // Type safety
  // Box<int> b = Box("oops");  // ← compile error
}


// ───────────────────────────────────────────────────────────────────
//  SECTION 11 — EXCEPTION HANDLING
// ───────────────────────────────────────────────────────────────────

class InsufficientFundsException implements Exception {
  final double amount;
  InsufficientFundsException(this.amount);
  @override String toString() =>
      "InsufficientFundsException: Need \$$amount more";
}

class BankAccount {
  double _balance;
  BankAccount(this._balance);

  void withdraw(double amount) {
    if (amount <= 0) throw ArgumentError("Amount must be positive");
    if (amount > _balance) throw InsufficientFundsException(amount - _balance);
    _balance -= amount;
  }

  double get balance => _balance;
}

void section11_exceptions() {
  print("\n══════════ SECTION 11: Exception Handling ══════════");

  BankAccount acc = BankAccount(100.0);

  // Multiple catch clauses
  try {
    acc.withdraw(150.0);
  } on InsufficientFundsException catch (e) {
    print("Custom: $e");
  } on ArgumentError catch (e) {
    print("Arg error: $e");
  } catch (e, stackTrace) {
    print("Generic: $e");
    // print(stackTrace);  // use for debugging
  } finally {
    print("finally: balance = ${acc.balance}");
  }

  // rethrow
  void riskyOp() {
    try {
      acc.withdraw(-50);
    } catch (e) {
      print("caught in riskyOp, rethrowing");
      rethrow;
    }
  }

  try {
    riskyOp();
  } catch (e) {
    print("caught after rethrow: $e");
  }

  // ── EDGE CASES ────────────────────────────────────────────────
  // Error vs Exception:
  //   Exception  — recoverable, expected by callers
  //   Error      — programming errors, should NOT be caught normally
  //                e.g. StackOverflowError, OutOfMemoryError

  // assert — only active in debug mode
  assert(acc.balance >= 0, "Balance should never go negative");
}


// ───────────────────────────────────────────────────────────────────
//  SECTION 12 — FLUTTER PREP: Stateless vs Stateful Widget Logic
//              (Pure Dart simulation of widget lifecycle)
// ───────────────────────────────────────────────────────────────────

// In Flutter, you'd import flutter/material.dart.
// Here we simulate the key differences with plain Dart classes.

// StatelessWidget — immutable, build() called once per config change
class StatelessCounter {
  final int count;
  StatelessCounter(this.count);
  String build() => "Stateless Count: $count";
  // To "update" you must create a new instance — you cannot mutate.
}

// StatefulWidget — has mutable State object; can call setState()
class StatefulCounterState {
  int _count = 0;

  void increment() {
    _count++;
    _rebuild();   // simulates setState()
  }

  void _rebuild() => print("UI rebuilt — count: $_count");

  String build() => "Stateful Count: $_count";
}

void section12_widgetLogic() {
  print("\n══════════ SECTION 12: Widget Logic (Flutter Prep) ══════════");

  // Stateless — immutable
  var w1 = StatelessCounter(5);
  print(w1.build());
  // To change, create new widget:
  w1 = StatelessCounter(6);
  print(w1.build());

  // Stateful — mutable internal state
  var state = StatefulCounterState();
  print(state.build());
  state.increment();
  state.increment();
  print(state.build());

  // ── Key differences ─────────────────────────────────────────────
  print("""
  StatelessWidget:
    ✔ Immutable; takes data via constructor
    ✔ No internal state
    ✔ Faster, simpler
    ✔ Use for: Text, Icon, Image with static data

  StatefulWidget:
    ✔ Mutable internal State<T> object
    ✔ setState() triggers rebuild
    ✔ Lifecycle: initState → build → setState → dispose
    ✔ Use for: Checkbox, TextField, animations, counters
  """);
}


// ───────────────────────────────────────────────────────────────────
//  SECTION 13 — SAMPLE PROGRAMS FROM SYLLABUS
// ───────────────────────────────────────────────────────────────────

// ── 13.1 Hello User Console App ──────────────────────────────────
void helloUser(String name) {
  print("Hello, $name! Welcome to Dart.");
}

// ── 13.2 Basic Todo List (add/remove/view) ────────────────────────
class TodoList {
  List<String> _tasks = [];

  void addTask(String task) {
    _tasks.add(task);
    print("Added: \"$task\"");
  }

  void removeTask(String task) {
    if (_tasks.remove(task)) {
      print("Removed: \"$task\"");
    } else {
      print("Task not found: \"$task\"");
    }
  }

  void viewTasks() {
    if (_tasks.isEmpty) {
      print("No tasks.");
      return;
    }
    for (int i = 0; i < _tasks.length; i++) {
      print("  ${i + 1}. ${_tasks[i]}");
    }
  }
}

// ── 13.3 OOP University Model ─────────────────────────────────────
class Person {
  String name;
  int    age;
  Person(this.name, this.age);
}

class Professor extends Person {
  String subject;
  Professor(String name, int age, this.subject) : super(name, age);
  String teach() => "Prof. $name teaches $subject";
}

class Course {
  String   title;
  Professor professor;
  List<Student> students = [];

  Course(this.title, this.professor);

  void enroll(Student s) {
    students.add(s);
    print("${s.name} enrolled in $title");
  }

  void roster() {
    print("Course: $title | Prof: ${professor.name}");
    for (var s in students) print("  - ${s.name} (${s.rollNo})");
  }
}

class Student extends Person {
  int    rollNo;
  double gpa;
  List<Course> courses = [];

  Student(String name, int age, this.rollNo, this.gpa) : super(name, age);

  void joinCourse(Course c) {
    c.enroll(this);
    courses.add(c);
  }
}

// ── 13.4 Async data fetch simulation ─────────────────────────────
Future<Map<String, dynamic>> fetchStudentData(int rollNo) async {
  await Future.delayed(Duration(milliseconds: 50));  // simulate API call
  if (rollNo == 999) throw Exception("Student not found");
  return {
    "name":   "Student_$rollNo",
    "marks":  [88, 76, 92, 85],
    "grade":  "A"
  };
}

void section13_programs() {
  print("\n══════════ SECTION 13: Sample Programs ══════════");

  // 13.1
  helloUser("Rahul");

  // 13.2
  print("\n-- Todo List --");
  TodoList todo = TodoList();
  todo.addTask("Buy groceries");
  todo.addTask("Study Dart");
  todo.addTask("Exercise");
  todo.viewTasks();
  todo.removeTask("Exercise");
  todo.removeTask("Watch TV");   // not in list
  todo.viewTasks();

  // 13.3
  print("\n-- University Model --");
  Professor prof = Professor("Dr. Sharma", 45, "Computer Science");
  Course    cs   = Course("CS208B Web Tech", prof);
  Student   s1   = Student("Alice", 20, 1001, 8.9);
  Student   s2   = Student("Bob",   21, 1002, 7.5);
  s1.joinCourse(cs);
  s2.joinCourse(cs);
  cs.roster();
  print(prof.teach());
}

Future<void> section13_async() async {
  print("\n-- Async Fetch --");
  try {
    var data = await fetchStudentData(1001);
    print("Fetched: $data");

    var marks = (data["marks"] as List<int>);
    double avg = marks.reduce((a, b) => a + b) / marks.length;
    print("Average marks: ${avg.toStringAsFixed(1)}");
  } catch (e) {
    print("Error: $e");
  }

  try {
    await fetchStudentData(999);
  } catch (e) {
    print("Expected error: $e");
  }
}


// ───────────────────────────────────────────────────────────────────
//  SECTION 14 — TOP INTERVIEW Q&A (Dart specific)
// ───────────────────────────────────────────────────────────────────

void section14_interviewQnA() {
  print("\n══════════ SECTION 14: Interview Q&A Demos ══════════");

  // Q: What is the difference between == and identical()?
  String a = "hello";
  String b = "hello";
  String c = String.fromCharCodes([104, 101, 108, 108, 111]);  // "hello"
  print("== :        ${a == b}");              // true  (value equality)
  print("identical:  ${identical(a, b)}");     // true  (same object, interned)
  print("identical c:${identical(a, c)}");     // false (different object)

  // Q: What is cascade notation (..)?
  List<int> nums = []
    ..add(1)
    ..add(2)
    ..add(3);
  print("cascade: $nums");   // [1, 2, 3]

  // Q: Difference between List.filled and List.generate?
  var filled   = List.filled(3, 0);             // [0, 0, 0] — same value
  var generated = List.generate(3, (i) => i*i); // [0, 1, 4] — computed
  print("filled:    $filled");
  print("generated: $generated");

  // Q: const constructor — compile-time constant object
  // (Requires all fields to be final and set in constructor)
  // (See ImmutablePoint below)

  // Q: factory constructor — returns existing or derived instance
  // (See Singleton below)

  // Q: What is the difference between Iterable and List?
  // List implements Iterable, but Iterable is lazy (no index access)
  Iterable<int> lazy = Iterable.generate(5, (i) => i * 2);
  print("iterable: ${lazy.toList()}");  // materialise when needed

  // Q: extension methods
  // (See below the main)

  // Q: enum
  print("day: ${Day.monday}");
  print("dayIndex: ${Day.monday.index}");   // 0

  // Q: Isolate concept (can't demo without dart:isolate easily)
  print("""
  Isolate = separate thread with own memory heap.
  Dart is single-threaded per isolate.
  Communicate via SendPort / ReceivePort (message passing).
  async/await does NOT use multiple threads — it uses event loop.
  """);
}

// Const constructor
class ImmutablePoint {
  final double x, y;
  const ImmutablePoint(this.x, this.y);
}

// Factory constructor / Singleton
class Config {
  static final Config _instance = Config._internal();
  factory Config() => _instance;
  Config._internal();
  String env = "production";
}

// Enum
enum Day { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

// Extension method on String
extension StringExtras on String {
  bool get isPalindrome {
    String clean = toLowerCase().replaceAll(' ', '');
    return clean == clean.split('').reversed.join('');
  }
  String repeat(int n) => List.filled(n, this).join();
}

void section14_extensions() {
  print("\n-- Extensions --");
  print("racecar isPalindrome: ${"racecar".isPalindrome}");
  print("hello isPalindrome:   ${"hello".isPalindrome}");
  print("ha repeat 3: ${"ha".repeat(3)}");
}

// Singleton test
void section14_singleton() {
  print("\n-- Singleton --");
  Config c1 = Config();
  Config c2 = Config();
  print("same instance: ${identical(c1, c2)}");  // true
  c1.env = "staging";
  print("c2.env: ${c2.env}");  // "staging" — same object
}

// Const objects
void section14_const() {
  print("\n-- Const Objects --");
  const p1 = ImmutablePoint(1, 2);
  const p2 = ImmutablePoint(1, 2);
  print("const identical: ${identical(p1, p2)}");  // true — shared!
  ImmutablePoint p3 = ImmutablePoint(1, 2);        // non-const
  print("non-const identical: ${identical(p1, p3)}"); // false
}


// ───────────────────────────────────────────────────────────────────
//  DRIVER — runs all sections
// ───────────────────────────────────────────────────────────────────
void main() async {
  print("╔══════════════════════════════════════════════╗");
  print("║      DART COMPLETE PREP SHEET OUTPUT        ║");
  print("╚══════════════════════════════════════════════╝");

  section1_variablesAndTypes();
  section2_nullSafety();
  section3_controlFlow();
  section4_functions();
  section5_oop();
  section6_mixins();
  section7_scope();
  await section8_async();
  section9_collections();
  section10_generics();
  section11_exceptions();
  section12_widgetLogic();
  section13_programs();
  await section13_async();
  section14_interviewQnA();
  section14_extensions();
  section14_singleton();
  section14_const();

  print("\n✅ All sections complete!");
}