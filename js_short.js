/*
===============================================================================
ES6 JAVASCRIPT - CONDENSED NOTES
===============================================================================
Unit 1: Advanced ES6 JavaScript Key Concepts
===============================================================================
*/

// ===============================================================================
// 1. VARIABLE DECLARATIONS: var vs let vs const
// ===============================================================================

var a = 10;       // Function scoped, hoisted, can be redeclared
let b = 20;       // Block scoped, cannot be redeclared
const c = 30;     // Block scoped, cannot be reassigned


// ===============================================================================
// 2. ARROW FUNCTIONS
// ===============================================================================

// Single parameter
let greet = name => `Hello ${name}`;

// Multiple parameters
let add = (a, b) => a + b;

// Multi-line with return
let multiply = (a, b) => {
  return a * b;
};

// Return object (wrap in parentheses)
let createUser = (name) => ({name: name, active: true});

// Lexical 'this' - Inherits from enclosing scope
function Person() {
  this.age = 20;
  setTimeout(() => {
    console.log(this.age); // Works correctly with arrow function
  }, 1000);
}


// ===============================================================================
// 3. TEMPLATE LITERALS
// ===============================================================================

let name = "John";
let age = 25;

console.log(`${name} is ${age} years old`);

// Multi-line
let message = `
  Hello User
  Welcome to ES6
`;


// ===============================================================================
// 4. ARRAY DESTRUCTURING
// ===============================================================================

const arr = [10, 20, 30];

// Basic
const [a, b, c] = arr;

// Skip elements
const [first, , third] = arr;

// Rest operator
const [x, ...rest] = arr; // rest = [20, 30]

// Default values
const [p = 5, q = 10] = [1]; // p = 1, q = 10


// ===============================================================================
// 5. OBJECT DESTRUCTURING
// ===============================================================================

const student = {name: "John", age: 20, roll: 5};

// Basic
const {name, age} = student;

// Rename
const {name: userName, age: userAge} = student;

// Default values
const {status = "active"} = student;

// Rest operator
const {name, ...details} = student; // details = {age: 20, roll: 5}

// In function parameters
function display({name, age}) {
  console.log(name, age);
}


// ===============================================================================
// 6. SPREAD OPERATOR (...)
// ===============================================================================

// Arrays - Merge
const arr1 = [1, 2, 3];
const arr2 = [4, 5, 6];
const merged = [...arr1, ...arr2]; // [1,2,3,4,5,6]

// Arrays - Copy
const copy = [...arr1]; // Independent copy

// Arrays - Pass as arguments
function sum(a, b, c) {
  return a + b + c;
}
console.log(sum(...[1, 2, 3])); // Output: 6

// Objects - Copy
const obj1 = {a: 1, b: 2};
const obj2 = {...obj1};

// Objects - Merge & Update
const updated = {...obj1, b: 5}; // {a: 1, b: 5}


// ===============================================================================
// 7. REST OPERATOR (...)
// ===============================================================================

// Function - Accept multiple arguments
function sumNumbers(...nums) {
  return nums.reduce((acc, val) => acc + val, 0);
}
console.log(sumNumbers(1, 2, 3, 4)); // 10

// Function - Multiple parameters (REST must be last)
function show(first, ...others) {
  console.log(first, others);
}

// Array destructuring
const [head, ...tail] = [1, 2, 3, 4];

// Object destructuring
const {id, ...data} = {id: 1, name: "John", age: 20};


// ===============================================================================
// 8. DEFAULT PARAMETERS
// ===============================================================================

function greetUser(name = "Guest", age = 18) {
  console.log(`${name}, ${age}`);
}

greetUser(); // Guest, 18
greetUser("John", 25); // John, 25

// With arrow functions
const multiply = (a = 2, b = 3) => a * b;


// ===============================================================================
// 8.5. ARRAY METHODS
// ===============================================================================

const numbers = [1, 2, 3, 4, 5];
const users = [{id: 1, name: "John", age: 25}, {id: 2, name: "Jane", age: 30}];

// MAP - Transform each element
const doubled = numbers.map(n => n * 2); // [2, 4, 6, 8, 10]
const names = users.map(u => u.name); // ["John", "Jane"]

// FILTER - Keep elements that pass test
const even = numbers.filter(n => n % 2 === 0); // [2, 4]
const adults = users.filter(u => u.age >= 30); // [{id: 2, name: "Jane", age: 30}]

// REDUCE - Accumulate to single value
const sum = numbers.reduce((acc, n) => acc + n, 0); // 15
const total = numbers.reduce((acc, n) => acc + n); // 15 (without initial value)

// REDUCE - Create object
const grouped = users.reduce((acc, u) => {
  acc[u.id] = u.name;
  return acc;
}, {}); // {1: "John", 2: "Jane"}

// FOREACH - Execute for each element (no return)
numbers.forEach(n => console.log(n));

// FIND - Get first matching element
const firstAdult = users.find(u => u.age >= 30); // {id: 2, ...}

// SOME - Check if any element passes test
const hasEven = numbers.some(n => n % 2 === 0); // true

// EVERY - Check if all elements pass test
const allPositive = numbers.every(n => n > 0); // true

// SORT - Sort array
const sorted = [...numbers].sort((a, b) => a - b); // Create copy to avoid mutation
const sortedUsers = [...users].sort((a, b) => a.age - b.age);

// INCLUDES - Check if array contains value
const hasThree = numbers.includes(3); // true

// CHAINING methods
const result = numbers
  .filter(n => n > 2)      // [3, 4, 5]
  .map(n => n * 2)         // [6, 8, 10]
  .reduce((acc, n) => acc + n, 0); // 24


// ===============================================================================
// 9. PROMISES - CREATING & CONSUMING
// ===============================================================================

// Create promise
function bakeCake() {
  return new Promise((resolve, reject) => {
    console.log("Baking...");
    setTimeout(() => {
      let success = true;
      if (success) {
        resolve("Cake is ready");
      } else {
        reject("Baking failed");
      }
    }, 2000);
  });
}

// Consume with then/catch
bakeCake()
  .then((msg) => console.log(msg))
  .catch((error) => console.log(error))
  .finally(() => console.log("Done"));

// Promise chaining
function fetchData(delay) {
  return new Promise((resolve) => {
    setTimeout(() => resolve("Data"), delay);
  });
}

fetchData(1000)
  .then((data) => {
    console.log(data);
    return "Processing...";
  })
  .then((msg) => console.log(msg));


// ===============================================================================
// 10. ASYNC/AWAIT
// ===============================================================================

async function orderCake() {
  try {
    console.log("Ordering...");
    const result = await bakeCake();
    console.log(result);
  } catch (error) {
    console.log("Error:", error);
  }
}

// orderCake();

// Multiple awaits
async function processData() {
  try {
    const data1 = await fetchData(1000);
    console.log(data1);
    
    const data2 = await fetchData(1000);
    console.log(data2);
  } catch (error) {
    console.log("Error:", error);
  }
}

// Async returns Promise
async function getName() {
  return "John";
}
// getName().then((name) => console.log(name));


// ===============================================================================
// 11. ERROR HANDLING
// ===============================================================================

// Try/catch/finally
try {
  // Code that might fail
  if (Math.random() > 0.5) throw new Error("Random error");
} catch (error) {
  console.log("Caught:", error.message);
} finally {
  console.log("Always runs");
}

// With promises
function validateAge(age) {
  return new Promise((resolve, reject) => {
    if (age >= 18) {
      resolve("Valid age");
    } else {
      reject("Too young");
    }
  });
}

validateAge(20)
  .then((msg) => console.log(msg))
  .catch((err) => console.log("Error:", err));


// ===============================================================================
// 12. QUICK REFERENCE
// ===============================================================================

/*
VARIABLES:
const x = 5;          // Use by default
let y = 10;           // If needs reassignment
var z = 15;           // Avoid in modern JS

ARROW FUNCTIONS:
const func = (a, b) => a + b;
const func = name => `Hello ${name}`;
const func = () => ({key: "value"});

TEMPLATE LITERALS:
const str = `Hello ${name}`;

DESTRUCTURING ARRAYS:
const [a, b, ...rest] = array;

DESTRUCTURING OBJECTS:
const {name, age, ...others} = object;

SPREAD OPERATOR:
[...arr1, ...arr2]
{...obj1, ...obj2}
func(...array)

REST OPERATOR:
function sum(...nums) {}
const [first, ...rest] = array;

PROMISES:
new Promise((resolve, reject) => { ... })
.then((value) => { ... })
.catch((error) => { ... })

ASYNC/AWAIT:
async function name() {
  const result = await promise;
}
*/

// ===============================================================================
// 13. PRACTICE PROBLEMS
// ===============================================================================

// 1. Rest operator - sum multiple numbers
function sum(...arr) {
  return arr.reduce((acc, val) => acc + val, 0);
}
console.log(sum(1, 2, 3)); // 6

// 2. Spread - merge arrays
const nums1 = [1, 2, 3];
const nums2 = [4, 5, 6];
const combined = [...nums1, ...nums2];

// 3. Copy and update object
const original = {name: "John", age: 30};
const updated_obj = {...original, age: 31};

// 4. Spread - pass array to function
console.log(Math.max(...[5, 2, 8, 1])); // 8

// 5. Extract first and last
const [first, , , last] = [10, 20, 30, 40];
console.log({first, last}); // {first: 10, last: 40}

// 6. Template literal with destructuring
const {name: uName, age: uAge} = {name: "Alice", age: 25};
console.log(`${uName} is ${uAge} years old`);

// 7. Default parameters
function greet(greeting = "Hello", name = "Guest") {
  return `${greeting} ${name}`;
}
console.log(greet()); // Hello Guest

// 8. Promise - resolves after 2 seconds
function wait(ms, value) {
  return new Promise((resolve) => {
    setTimeout(() => resolve(value), ms);
  });
}
// wait(2000, "Done").then(msg => console.log(msg));

// 9. Promise - rejects on condition
function check(condition) {
  return new Promise((resolve, reject) => {
    condition ? resolve("OK") : reject("Failed");
  });
}

// 10. Async/await with error handling
async function safeWait() {
  try {
    const result = await wait(1000, "Success");
    console.log(result);
  } catch (error) {
    console.log("Error:", error);
  }
}

console.log("=== ES6 SHORT NOTES READY ===");
