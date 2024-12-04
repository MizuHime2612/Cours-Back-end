console.log("Hi");

let fullname: string;
fullname = "trang";
console.log(fullname);

let age: number;
age = 20;

let gender: boolean;
gender = true;

let empty: null;
empty = null;

let randomValue: any;
randomValue = 18;
randomValue = "Hi";
randomValue = true;

// 1. variable - biến
// var, let, const(hằng số)
var number1: number;
number1 = 19

const PI: number = 3.14;

//2. Branching statment - câu điều kiện rẽ nhánh
//3. Loop
for(let i:number = 0; i<10; i++){
    console.log("Hi");
}

//4.hàm
function sum(number1: number, number2: number): number{
    return number1 + number2;
}