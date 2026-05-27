/*
===========================================================
Dart Programming Coding Assignment
Course: Web Technology(CS208B)

Instructions:
1. DO NOT change function names
2. DO NOT modify the driver() function
3. Implement logic only inside the marked sections
4. Use Dart concepts wherever required
===========================================================
*/


// ------------------ Dummy Data ------------------

List<int?> nums = [-3, 12, null, 5, -2, 20, 16, null, 8];

class Customer {
  String name;
  int id;
  int age;
  String category;
  String city;

  Customer(this.name, this.id, this.age, this.category, this.city);
}

Customer cust = Customer("Rahul", 101, 25, "Premium", "Delhi");



// =================================================
// Q1
// Demonstrate Dart Null Safety.
// =================================================
int safeSquareSum(List<int?> arr) {

  int sum = 0;

  for (int? val in arr) {
    if (val != null) {
      sum += val * val;
    } else {
      sum += 1;
    }
  }

  return sum;
}



// =================================================
// Q2
// Sum logic with null safety
// =================================================
int sumEven(List<int?> arr) {

  int sum = 0;

  for (int? val in arr) {
    if (val != null) {
      if (val % 2 == 0) {
        sum += val;
      } else {
        sum -= val;
      }
    }
  }

  return sum;
}



// =================================================
// Q3
// Calculator using switch
// =================================================
num calculator(num a, num b, String op) {

  switch (op) {
    case "+":
      return a + b;

    case "-":
      return a - b;

    case "*":
      return a * b;

    case "/":
      return a / b;

    default:
      print("Invalid Operator");
      return 0;
  }
}



// =================================================
// Q4
// Customer summary
// =================================================
String customerSummary(Customer c) {

  return "Customer ${c.name} from ${c.city} is ${c.category}";
}



// =================================================
// Q5
// Category Check
// =================================================
String categoryCheck(Customer c) {

  if (c.category == "Premium") {
    return "High Value Customer";
  } else {
    return "Regular Customer";
  }
}



// =================================================
// Q6
// Inheritance Example
// =================================================
class VIPCustomer extends Customer {

  int discount;

  VIPCustomer(
    String name,
    int id,
    int age,
    String category,
    String city,
    this.discount
  ) : super(name, id, age, category, city);
}

int vipDiscount() {

  VIPCustomer vp =
      VIPCustomer("Rahul", 101, 25, "Premium", "Delhi", 20);

  return vp.discount;
}



// =================================================
// Q7
// Mixin Example
// =================================================
mixin Greet {

  String greet() {
    return "Welcome Customer";
  }
}

class Demo with Greet {}

String mixinDemo() {

  Demo d = Demo();

  return d.greet();
}



// =================================================
// Q8
// Scope Demo
// =================================================
int scopeDemo() {

  int x = 5;

  return x;
}



// =================================================
// Q9
// Future after 2 seconds
// =================================================
Future<String> analyzeNumbers(List<int> arr) {

  int sum = 0;

  for (int i = 0; i < arr.length; i++) {
    sum += arr[i];
  }

  double avg = sum / arr.length;

  String msg;

  if (avg > 10) {
    msg = "Good Dataset";
  } else {
    msg = "Small Dataset";
  }

  return Future.delayed(
    Duration(seconds: 2),
    () => msg,
  );
}



// =================================================
// Q10
// Async Await Example
// =================================================
Future<void> reportDataset(List<int> arr) async {

  String res = await analyzeNumbers(arr);

  print(res.toUpperCase());
}



// =================================================
// DRIVER FUNCTION (DO NOT MODIFY)
// =================================================
Future<void> driver() async {

  print("Q1: ${safeSquareSum(nums)}");

  print("Q2: ${sumEven(nums)}");

  print("Q3: ${calculator(10, 5, '+')}");

  print("Q4: ${customerSummary(cust)}");

  print("Q5: ${categoryCheck(cust)}");

  print("Q6: ${vipDiscount()}");

  print("Q7: ${mixinDemo()}");

  print("Q8: ${scopeDemo()}");

  // Removing null values for Q9/Q10
  List<int> filtered =
      nums.where((e) => e != null).cast<int>().toList();

  print("Q9: ${await analyzeNumbers(filtered)}");

  await reportDataset(filtered);
}



void main() {
  driver();
}