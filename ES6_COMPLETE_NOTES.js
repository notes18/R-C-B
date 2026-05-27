/*
===============================================================================
ES6 ADVANCED JAVASCRIPT - COMPLETE STRUCTURED NOTES
===============================================================================
Unit 1: Advanced ES6 JavaScript (10 hours)

Topics Covered:
- Variable Declarations (var vs let vs const)
- Arrow Functions  
- Template Literals
- Array Destructuring
- Object Destructuring
- Spread Operator (Arrays & Objects)
- Rest Operator
- Default Parameters
- Asynchronous Programming & Promises
- Error Handling

===============================================================================
*/

// ===============================================================================
// 1. VARIABLE DECLARATIONS: var vs let vs const
// ===============================================================================

/*
SYNTAX & SCOPE:
- var: Function scoped, hoisted, can be redeclared and reassigned
- let: Block scoped, hoisted (temporal dead zone), can be reassigned not redeclared
- const: Block scoped, must be initialized, cannot be reassigned (but object properties can be mutated)
*/

// VAR - Function scoped, hoisted
console.log(x); // Output: undefined (hoisted)
var x = 5;
console.log(x); // Output: 5

// Redeclaration allowed with var
var a = 10;
var a = 20; // No error
console.log(a); // Output: 20

// LET - Block scoped, cannot be redeclared
let b = 10;
// let b = 20; // Error: Identifier 'b' has already been declared
console.log(b); // Output: 10

// CONST - Block scoped, must be initialized, cannot be reassigned
const c = 30;
// c = 40; // Error: Assignment to constant variable
console.log(c); // Output: 30

// Const with objects - properties can be mutated
const student = {
  name: "Dennis",
  age: 20
};
student.age = 21; // Allowed - mutating object property
// student = {}; // Error - cannot reassign the object itself


// ===============================================================================
// 2. ARROW FUNCTIONS - SYNTAX & BEHAVIOR
// ===============================================================================

/*
SYNTAX:
- Single parameter (no parens):          param => expression
- Multiple parameters:                   (param1, param2) => expression
- No parameters:                         () => expression
- Single line (implicit return):         () => expression
- Multi-line (explicit return):          () => { statements; return value; }

KEY FEATURE: Arrow functions have LEXICAL 'this' keyword (inherits from enclosing scope)
*/

// Single parameter, single line
let greet = name => `hello ${name}`;
console.log(greet("John")); // Output: hello John

// Multiple parameters
let add = (a, b) => a + b;
console.log(add(5, 3)); // Output: 8

// No parameters
let sayHi = () => "Hi!";
console.log(sayHi()); // Output: Hi!

// Multi-line arrow function with explicit return
let multiply = (a, b) => {
  const result = a * b;
  return result;
};
console.log(multiply(4, 5)); // Output: 20

// Arrow function returning an OBJECT (must wrap in parentheses)
let createStudent = (name) => ({
  name: name,
  status: "active"
});
console.log(createStudent("Abc")); // Output: {name: "Abc", status: "active"}

// LEXICAL 'this' - Arrow functions inherit 'this' from enclosing scope
function Person() {
  this.age = 20;
  
  // Arrow function - inherits 'this' from Person scope
  setTimeout(() => {
    console.log(this.age); // Output: 20 (correct 'this')
  }, 1000);
  
  // Compare with regular function - has its own 'this'
  // setTimeout(function() {
  //   console.log(this.age); // Output: undefined (wrong 'this')
  // }, 1000);
}
new Person();

// Arrow function in object method - does NOT work properly
const myobj = {
  name: "Vk",
  roll: 18,
  display: () => {
    console.log(this.name); // 'this' refers to global scope, not object
  }
};
// myobj.display(); // Output: undefined

// Use normal function for object methods
const obj = {
  name: "abd",
  roll: 17,
  display: function () {
    console.log(this.name); // 'this' correctly refers to object
  }
};
obj.display(); // Output: vk


// ===============================================================================
// 3. TEMPLATE LITERALS
// ===============================================================================

/*
SYNTAX:
- Use backticks: `text`
- Variables/expressions: ${variable} or ${expression}
- Supports multi-line strings
- Better readability than string concatenation
*/

// Basic template literal
let name = "Alice";
let age = 25;
console.log(`Name: ${name}, Age: ${age}`);
// Output: Name: Alice, Age: 25

// Template literals with expressions
let x = 10;
let y = 20;
console.log(`Sum: ${x + y}, Product: ${x * y}`);
// Output: Sum: 30, Product: 200

// Multi-line template literals
let message = `
  Hello User!
  Welcome to ES6
  This is a multi-line string
`;
console.log(message);

// With objects
const student_obj = {
  name: "Abd",
  roll: 17,
  marks: 360
};
console.log(`Student Name: ${student_obj.name}, Roll: ${student_obj.roll}, Marks: ${student_obj.marks}`);
// Output: Student Name: Abd, Roll: 17, Marks: 360

// With function calls in template literals
function getAge() {
  return 30;
}
console.log(`User age is ${getAge()}`);
// Output: User age is 30


// ===============================================================================
// 4. ARRAY DESTRUCTURING
// ===============================================================================

/*
SYNTAX:
- Basic:                     const [a, b] = array
- Skip elements:             const [a, , c] = array
- Rest operator:             const [a, ...rest] = array
- Default values:            const [a = 5, b = 10] = array
- Swapping values:           [a, b] = [b, a]
*/

// Basic array destructuring
const arr = [10, 20, 30];
const [a, b, c] = arr;
console.log(a, b, c); // Output: 10 20 30

// Skip elements
const arr1 = [10, 20, 50, 36];
const [first, , third] = arr1;
console.log(first, third); // Output: 10 50

// Rest operator with destructuring
const [x, y, ...z] = arr1;
console.log(y, z); // Output: 20 [50, 36]

// Default values in destructuring
const [p = 5, q = 10] = [1];
console.log(p, q); // Output: 1 10

// Destructuring from function parameters
function sum([num1, num2, num3]) {
  return num1 + num2 + num3;
}
console.log(sum([10, 20, 30])); // Output: 60

// Extract first and last elements
const numbers = [10, 20, 30];
const [first_elem] = numbers;
const last_elem = numbers[numbers.length - 1];
console.log({first: first_elem, last: last_elem}); 
// Output: {first: 10, last: 30}


// ===============================================================================
// 5. OBJECT DESTRUCTURING
// ===============================================================================

/*
SYNTAX:
- Basic:                     const {prop1, prop2} = object
- Rename:                    const {prop1: alias1} = object
- Default values:            const {prop1 = value} = object
- Rest operator:             const {a, ...rest} = object
- Nested:                    const {a: {b}} = object
*/

// Basic object destructuring
const person = {
  name: "vk",
  age: 21,
  key: "pqr"
};
let {name, age, key} = person;
console.log(name, age, key); // Output: vk 21 pqr

// Rename properties using aliases
let {key: mykey, name: myname, age: myage} = person;
console.log(mykey, myname, myage); // Output: pqr vk 21

// Default values
const {status = "active", role = "user"} = person;
console.log(status, role); // Output: active user

// Rest operator in object destructuring
const user = {
  id: 18,
  username: "abd",
  course: "BTech"
};
const {id, ...otherDetails} = user;
console.log("Id:", id); // Output: 18
console.log("Other details:", otherDetails); 
// Output: {username: "abd", course: "BTech"}

// Object destructuring in function parameters
function showobj({name, age, key}) {
  console.log(name);  // Output: vk
  console.log(age);   // Output: 21
  console.log(key);   // Output: pqr
}
showobj(person);

// Template literal with object destructuring
function formatStudent(obj) {
  const {name, course} = obj;
  return `${name} is enrolled in ${course}`;
}
console.log(formatStudent({name: "Aarav", course: "B.Tech"}));
// Output: Aarav is enrolled in B.Tech

// Spread operator with object - create copy and merge
const myobj = {
  name: "Abc",
  age: 20,
  key: "pqr"
};
const duplicateObj = {key: "xyz", ...myobj, age: 21};
console.log(duplicateObj); 
// Output: {key: "Abc", name: "Abc", age: 21}

// Iterate over object entries
const testObj = {
  name: "John",
  age: 30,
  city: "NYC"
};
for(let [key, value] of Object.entries(testObj)) {
  console.log(key, ":", value);
}
// Output: name : John
//         age : 30
//         city : NYC


// ===============================================================================
// 6. SPREAD OPERATOR (...) - ARRAYS
// ===============================================================================

/*
SYNTAX:
- Merge arrays:              const merged = [...arr1, ...arr2]
- Copy array:                const copy = [...array]
- Add elements:              const newArr = [...arr, newElem]
- Pass to function:          func(...array)
*/

// Merge two or more arrays
const arr_1 = [1, 2, 3];
const arr_2 = [4, 5, 6];
const merged_array = [...arr_1, ...arr_2];
console.log(merged_array); // Output: [1, 2, 3, 4, 5, 6]

// Copy array (creates new array, not reference)
const original = [10, 20, 30];
const duplicated = [...original];
duplicated[0] = 100;
console.log(original); // Output: [10, 20, 30] (unchanged)
console.log(duplicated); // Output: [100, 20, 30]

// Add elements to array without modifying original
const arr = [10, 20, 3];
const newarr = [...arr, 400, 500];
console.log("Original:", arr); // Output: [10, 20, 3]
console.log("New:", newarr); // Output: [10, 20, 3, 400, 500]

// Insert elements in specific position
const arr_test = [1, 2, 3];
const inserted = [0, ...arr_test, 4]; // [0, 1, 2, 3, 4]
console.log(inserted);

// Pass array elements as function arguments
let array = [1, 2, 3];
function sum_func(a, b, c) {
  return a + b + c;
}
console.log(sum_func(...array)); // Output: 6

// Find maximum using spread operator
function findMax_spread(arr) {
  return Math.max(...arr);
}
console.log(findMax_spread([1, 5, 3])); // Output: 5


// ===============================================================================
// 7. SPREAD OPERATOR (...) - OBJECTS
// ===============================================================================

/*
SYNTAX:
- Copy object:               const copy = {...object}
- Merge objects:             const merged = {...obj1, ...obj2}
- Update property:           const updated = {...obj, prop: newValue}
- Add new property:          const newObj = {...obj, newProp: value}
*/

// Copy object
const student_orig = {
  name: "virat kohli",
  roll: 18,
  marks: 85
};
const student_copy = {...student_orig};
student_copy.marks = 100;
console.log("Original:", student_orig); // Output: marks: 85
console.log("Copy:", student_copy); // Output: marks: 100

// Copy and update object property
const obj_update = {
  name: "vk",
  branch: "CSE",
  roll: 18
};
const updated_obj = {...obj_update, name: "abd"};
console.log(obj_update); // Original unchanged
console.log(updated_obj); // Updated with new name

// Merge two objects
const baseProperties = {
  name: "John",
  age: 30
};
const additionalProperties = {
  city: "NYC",
  age: 31 // This overwrites age: 30
};
const merged_obj = {...baseProperties, ...additionalProperties};
console.log(merged_obj); 
// Output: {name: "John", age: 31, city: "NYC"}

// Add new properties to object
const extraInfo_obj = {
  city: "Delhi",
  college: "KIET"
};
const profile = {...student_orig, ...extraInfo_obj};
console.log(profile);
// Output: {name: "...", roll: 18, marks: 85, city: "Delhi", college: "KIET"}

// Dynamic property update
function updateObject(obj, newKey, newValue) {
  return {
    ...obj,
    [newKey]: newValue
  };
}
console.log(updateObject({a: 1}, "b", 2)); // Output: {a: 1, b: 2}


// ===============================================================================
// 8. REST OPERATOR (...)
// ===============================================================================

/*
SYNTAX:
- Function parameters:       function func(...args)
- Array destructuring:       const [a, ...rest] = array
- Object destructuring:      const {a, ...rest} = object

REST collects remaining elements into an array/object
Used in function definitions to accept variable number of arguments
*/

// REST in function - accept multiple arguments
function sumNumbers(...nums) {
  const sum = nums.reduce((acc, val) => acc + val, 0);
  return sum;
}
console.log("Sum:", sumNumbers(1, 2, 3)); // Output: 6
console.log("Sum:", sumNumbers(10, 20)); // Output: 30

// REST with multiple parameters - REST must be last
function displayInfo(first, second, ...others) {
  console.log("First:", first);
  console.log("Second:", second);
  console.log("Others:", others);
}
displayInfo(1, 2, 3, 4, 5);
// Output: First: 1
//         Second: 2
//         Others: [3, 4, 5]

// REST in array destructuring
const numbers_arr = [11, 22, 33, 44, 55];
const [first_num, ...remaining] = numbers_arr;
console.log("First:", first_num); // Output: 11
console.log("Remaining:", remaining); // Output: [22, 33, 44, 55]

// Skip and REST
const [num1, , num3, ...rest_nums] = [1, 2, 3, 4, 5];
console.log(num1, num3, rest_nums); // Output: 1 3 [4, 5]

// REST in object destructuring
const user_obj = {
  id: 18,
  username: "rcb",
  course: "BTech",
  city: "Delhi"
};
const {id, username, ...details} = user_obj;
console.log("Id:", id); // Output: 18
console.log("Username:", username); // Output: rcb
console.log("Details:", details); // Output: {course: "BTech", city: "Delhi"}

// Average function using REST
function average(...nums) {
  const sum = nums.reduce((acc, val) => acc + val, 0);
  return sum / nums.length;
}
console.log("Average:", average(1, 2, 3, 5)); // Output: 2.75


// ===============================================================================
// 9. DEFAULT PARAMETERS
// ===============================================================================

/*
SYNTAX:
- Single default:            function func(a = 5)
- Multiple defaults:         function func(a = 5, b = 10)
- Applied if undefined:      func() uses default values
- Evaluated each call:       Can use expressions as defaults
*/

// Function with default parameters
function addDefault(a = 5, b = 10) {
  return a + b;
}
console.log("Default Add:", addDefault()); // Output: 15 (5 + 10)
console.log("Default Add:", addDefault(10, 5)); // Output: 15

// Default with expressions
function withDefaults(a = 1, b = a + 1) {
  return a * b;
}
console.log(withDefaults()); // Output: 2 (1 * 2)
console.log(withDefaults(5)); // Output: 30 (5 * 6)

// Default in arrow functions
const multiply_default = (a = 2, b = 3) => a * b;
console.log(multiply_default()); // Output: 6
console.log(multiply_default(4)); // Output: 12

// Default in destructured parameters
function greetUser({name = "Guest", age = 18} = {}) {
  console.log(`Hello ${name}, age ${age}`);
}
greetUser(); // Output: Hello Guest, age 18
greetUser({name: "John"}); // Output: Hello John, age 18
greetUser({name: "Jane", age: 25}); // Output: Hello Jane, age 25


// ===============================================================================
// 10. ASYNCHRONOUS PROGRAMMING - CALLBACKS (Introduction)
// ===============================================================================

/*
CALLBACKS:
- Function passed as argument to another function
- Executed after vke event or operation
- Common in older async code (leads to "callback hell")

SYNTAX:
function asyncFunc(callback) {
  setTimeout(() => {
    callback(result);
  }, delay);
}
*/

// Basic callback example
function bakeCake(callback) {
  console.log("going to bake cake");
  setTimeout(() => {
    console.log("baking cake");
    callback("cake ready");
  }, 2000);
}

// Using callback
// bakeCake((message) => {
//   console.log(message);
// });

// Problem with callbacks: Callback Hell (nested callbacks)
// function stepOne(callback) {
//   setTimeout(() => callback("step 1 done"), 1000);
// }
// function stepTwo(callback) {
//   setTimeout(() => callback("step 2 done"), 1000);
// }
// stepOne((msg) => {
//   console.log(msg);
//   stepTwo((msg2) => {
//     console.log(msg2); // Nested callbacks - hard to read
//   });
// });


// ===============================================================================
// 11. PROMISES - CREATING & CONSUMING
// ===============================================================================

/*
PROMISE STATE:
- Pending: Initial state, operation not yet completed
- Fulfilled: Operation completed successfully, has a resolve value
- Rejected: Operation failed, has a reject reason

SYNTAX:
const promise = new Promise((resolve, reject) => {
  if (condition) {
    resolve(value); // Fulfills promise
  } else {
    reject(error); // Rejects promise
  }
});

CONSUMING:
promise
  // .then((value) => { /* handle success */ 
//   .catch((error) => { /* handle failure */ })
//   .finally(() => { /* cleanup */ });
// */

// Create a Promise that resolves after 2 seconds
function createSuccessPromise(message) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(message);
    }, 2000);
  });
}

// Create a Promise that rejects based on condition
function createConditionalPromise(condition) {
  return new Promise((resolve, reject) => {
    if (condition) {
      resolve("Success");
    } else {
      reject("Failed");
    }
  });
}

// Consuming Promise with then() and catch()
function handlePromise(promise) {
  promise
    .then((msg) => console.log("Success:", msg))
    .catch((err) => console.log("Error:", err));
}

// Promise example -- IMP
function bakeCakePromise() {
  return new Promise((resolve, reject) => {
    console.log("-> putting in cake in oven");
    
    setTimeout(() => {
      let success = false; // Simulated condition
      if (success) {
        resolve("cake is baked");
      } else {
        reject("failed to bake");
      }
    }, 2000);
  });
}

// Consuming the promise -- IMP
bakeCakePromise()
  .then((msg) => {
    console.log("Success:", msg);
    return "now you can eat the cake";
  })
  .then((msg) => console.log(msg))
  .catch((msg) => console.log("Error:", msg));

// Promise chaining
function fetchData(delay, shouldSucceed) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      shouldSucceed ? resolve("Data fetched") : reject("Fetch failed");
    }, delay);
  });
}

// Chain multiple promises
fetchData(1000, true)
  .then((data) => {
    console.log(data); // Output: Data fetched
    return "Processing...";
  })
  .then((msg) => {
    console.log(msg); // Output: Processing...
    return "Complete";
  })
  .then((msg) => console.log(msg)) // Output: Complete
  .catch((error) => console.log("Error:", error));

// Promise with finally()
createSuccessPromise("Operation Successful")
  .then((msg) => console.log(msg))
  .catch((err) => console.log(err))
  .finally(() => console.log("Cleanup: Operation finished"));
// Output: Cleanup: Operation finished (always executes)


// ===============================================================================
// 12. PROMISE UTILITY METHODS
// ===============================================================================

/*
Promise.all(): All promises must resolve
Promise.race(): Returns first promising to resolve or reject
Promise.allSettled(): Returns all promises results (resolved or rejected)
Promise.any(): Returns first resolved promise
*/

// Promise.all() - all must succeed
const p1 = createSuccessPromise("P1");
const p2 = createSuccessPromise("P2");

// Promise.all([p1, p2])
//   .then((results) => console.log("All promises resolved:", results))
//   .catch((error) => console.log("One promise failed:", error));

// Promise.race() - first to settle wins
const p3 = new Promise((resolve) => setTimeout(() => resolve("Fast"), 100));
const p4 = new Promise((resolve) => setTimeout(() => resolve("Slow"), 5000));

// Promise.race([p3, p4])
//   .then((result) => console.log("First to complete:", result));
//   // Output: Fast


// ===============================================================================
// 13. ASYNC/AWAIT - MODERN ASYNCHRONOUS PROGRAMMING
// ===============================================================================

/*
SYNTAX:
async function functionName() {
  try {
    const result = await promise;
    return result;
  } catch (error) {
    // handle error
  }
}

KEY POINTS:
- async function always returns a Promise
- await pauses execution until Promise settles
- Makes async code look synchronous
- Must use with try/catch for error handling
- Can only use await inside async function
*/

// Basic async/await
async function makeOrder() {
  try {
    console.log("1. start baking the cake");
    const cake = await bakeCakePromise();
    console.log("2. " + cake);
  } catch(e) {
    console.log("Error:", e);
  }
}
// makeOrder(); // Uncomment to run

// Async function with multiple awaits
async function processData() {
  try {
    console.log("Processing started");
    const data1 = await fetchData(1000, true);
    console.log("Step 1:", data1);
    
    const data2 = await fetchData(1000, true);
    console.log("Step 2:", data2);
    
    return "All done";
  } catch(error) {
    console.log("Error:", error);
  }
}
// processData();

// Async function returns a Promise
async function returnPromise() {
  return "Hello from async";
}

// Can be consumed like regular promise
returnPromise().then((msg) => console.log(msg));
// Output: Hello from async

// Async/await with Promise.all()
async function getAllData() {
  try {
    const [data1, data2] = await Promise.all([
      fetchData(1000, true),
      fetchData(1000, true)
    ]);
    console.log("Data1:", data1, "Data2:", data2);
  } catch(error) {
    console.log("Error:", error);
  }
}
// getAllData();


// ===============================================================================
// 14. ERROR HANDLING - try/catch/finally
// ===============================================================================

/*
SYNTAX:
try {
  // Code that might throw error
} catch (error) {
  // Handle error
} finally {
  // Always executes, cleanup code
}

Works with:
- Async/await (try/catch)
- Promises (.catch())
- Regular functions (try/catch)
*/

// Try/catch with async/await
async function safeFetchData() {
  try {
    console.log("Fetching...");
    const result = await fetchData(1000, false); // Will reject
    console.log("Result:", result);
  } catch (error) {
    console.log("Caught error:", error);
  } finally {
    console.log("Fetch operation completed");
  }
}
// safeFetchData();

// Try/catch with manual throw
function validateAge(age) {
  try {
    if (age < 0) throw new Error("Age cannot be negative");
    if (age > 150) throw new Error("Age cannot exceed 150");
    console.log("Valid age:", age);
  } catch (error) {
    console.log("Validation error:", error.message);
  }
}
validateAge(25); // Output: Valid age: 25
validateAge(-5); // Output: Validation error: Age cannot be negative

// Try/catch with promises
createConditionalPromise(false)
  .then((msg) => console.log(msg))
  .catch((error) => {
    console.log("Caught in catch:", error);
  });


// ===============================================================================
// 15. COMPREHENSIVE PRACTICE PROBLEMS & SOLUTIONS
// ===============================================================================

// PROBLEM 1: Rest operator - Accept multiple numbers and return their sum
console.log("\n--- PROBLEM 1: Sum with Rest Operator ---");
function sum(...arr) {
  let total = 0;
  for(let i = 0; i < arr.length; i++) {
    total = total + arr[i];
  }
  return total;
}
console.log("Sum:", sum(1, 2, 3, 4, 5)); // Output: 15

// PROBLEM 2: Spread operator - Merge two arrays
console.log("\n--- PROBLEM 2: Merge Arrays ---");
const arr1_problem = [2, 3, 5];
const arr2_problem = [6, 7, 8];
const mergedArray_problem = [...arr1_problem, ...arr2_problem];
console.log("Merged:", mergedArray_problem); // Output: [2, 3, 5, 6, 7, 8]

// PROBLEM 3: Copy and update object using spread
console.log("\n--- PROBLEM 3: Copy and Update Object ---");
const obj_problem = {
  name: "vk",
  branch: "CSE",
  roll: 18
};
const myobj_problem = {...obj_problem, name: "abd"};
console.log("Original:", obj_problem);
console.log("Updated:", myobj_problem);

// PROBLEM 4: Pass array elements as function arguments using spread
console.log("\n--- PROBLEM 4: Spread in Function Arguments ---");
let arr_problem = [1, 2, 3];
function sum_args(a, b, c) {
  return a + b + c;
}
console.log("Sum via spread:", sum_args(...arr_problem)); // Output: 6

// PROBLEM 5: Extract first and last elements using destructuring
console.log("\n--- PROBLEM 5: Extract Elements ---");
function extractElements(arr) {
  const [first] = arr;
  const last = arr[arr.length - 1];
  return {first: first, last: last};
}
console.log("Extracted:", extractElements([10, 20, 30])); 
// Output: {first: 10, last: 30}

// PROBLEM 6: Object destructuring with template literals
console.log("\n--- PROBLEM 6: Format Student ---");
function formatStudentProblem(obj) {
  const {name, course} = obj;
  return `${name} is enrolled in ${course}`;
}
console.log(formatStudentProblem({name: "Aarav", course: "B.Tech"}));
// Output: Aarav is enrolled in B.Tech

// PROBLEM 7: Default parameters
console.log("\n--- PROBLEM 7: Default Parameters ---");
function addDefaultProblem(a = 5, b = 10) {
  return a + b;
}
console.log("Add with defaults:", addDefaultProblem()); // Output: 15
console.log("Add with defaults:", addDefaultProblem(10, 5)); // Output: 15

// PROBLEM 8: Promise resolves after 2 seconds
console.log("\n--- PROBLEM 8: Promise Success ---");
function createSuccessPromiseProblem(message) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(message);
    }, 2000);
  });
}
// createSuccessPromiseProblem("Done").then((msg) => console.log("Result:", msg));

// PROBLEM 9: Promise rejects if condition fails
console.log("\n--- PROBLEM 9: Conditional Promise ---");
function createConditionalPromiseProblem(condition) {
  return new Promise((resolve, reject) => {
    if (condition) {
      resolve("Success");
    } else {
      reject("Failed");
    }
  });
}
console.log("Promise created (true)");

// PROBLEM 10: Consume Promise with then() and catch()
console.log("\n--- PROBLEM 10: Handle Promise ---");
function handlePromiseProblem(promise) {
  promise
    .then((msg) => console.log("Success:", msg))
    .catch((err) => console.log("Error:", err));
}
handlePromiseProblem(createConditionalPromiseProblem(true));
// Output: Success: Success
handlePromiseProblem(createConditionalPromiseProblem(false));
// Output: Error: Failed


// ===============================================================================
// 16. QUICK REFERENCE & SYNTAX CHEATSHEET
// ===============================================================================

/*
VARIABLE DECLARATIONS:
const x = 5;          // Block scoped, cannot reassign
let y = 10;           // Block scoped, can reassign
var z = 15;           // Function scoped, hoisted

ARROW FUNCTIONS:
const add = (a, b) => a + b;
const greet = name => `Hello ${name}`;
const obj = () => ({key: "value"});

TEMPLATE LITERALS:
const str = `Hello ${name}`;
const multiline = `Line 1
                    Line 2`;

DESTRUCTURING:
const [a, b, ...rest] = array;
const {name, age, ...others} = object;

SPREAD OPERATOR:
const merged = [...arr1, ...arr2];
const copied = {...object};
func(...array);

REST OPERATOR:
function sum(...nums) {}
const [first, ...rest] = array;
const {a, ...rest} = object;

PROMISES:
new Promise((resolve, reject) => {});
.then((value) => {})
.catch((error) => {})
.finally(() => {})

ASYNC/AWAIT:
async function name() {
  try {
    const result = await promise;
  } catch (error) {}
}

DEFAULT PARAMETERS:
function func(a = 5, b = 10) {}
*/

console.log("\n=== ES6 NOTES COMPLETE ===");
