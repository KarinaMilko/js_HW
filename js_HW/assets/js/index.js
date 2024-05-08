const a = 3;
const b = 5;
const res1 = a * b;
console.log(res1);

const c = 100;
const d = 4;
const res2 = c / d;
console.log(res2);

const e = 48;
const f = 10;
const res3 = +e + +f;
console.log(res3);

console.log(typeof 11);

console.log(typeof true);

console.log(typeof "java script");

console.log(typeof "100");

let num = 1;
num += 11;
console.log(num);
num -= 11;
console.log(num);
num *= 11;
console.log(num);
num /= 11;
console.log(num);
num = ++num;
console.log(num);
num = --num;
console.log(num);

let firstNumber = +prompt("Напиши число:");
alert(firstNumber ** 2);

let firstNum = +prompt("Напиши перше число:");
let secondNum = +prompt("Напиши друге число:");
alert((+firstNum + +secondNum) / 2);

const amountMin = +prompt("Кількість хвилин: ");
console.log(amountMin * 60);

const greeting = "Hello, ";
const userName = prompt("What's your name?");
alert(greeting + userName + "!");
document.write("<p>" + greeting + " " + userName + "<p>");
