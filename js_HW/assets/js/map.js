"use strict";

// Нехай даний масив масивів ([[1,"first"], [3,"third"]]).
// Створіть колекцію Map з цього масиву (по суті,
// вона співставляє значенням чисел їх порідковий числівник).

const numberMap = new Map();
numberMap.set(1, "first").set(3, "third");

// Отримайте кількість елементів.

console.log(numberMap.size);

// Додати та видалити елемент.

numberMap.set(2, "second");
numberMap.delete(1);

// Здійсніть пошук за ключом.

console.log(numberMap.get(2));

// Перевірити, чи є в мапі числівник для числа 2.

console.log(numberMap.has(2));

// Отримайте список ключів та значень окремо.

console.log(numberMap.keys());
console.log(numberMap.values());

// *Написати функцію, яка перероблятиме текст з числами
// "This year I will enter the 1 grade. I have two brothers. I am the 3 child of my parents."
//  на текст з порядковими числівниками за допомогою мапи вище:
// "This year I will enter the first grade. I have two brothers. I am the third child of my parents."

const convertingNumbersToText = new Map();
convertingNumbersToText.set("1", "first").set("3", "third");
const text =
  "This year I will enter the 1 grade. I have two brothers. I am the 3 child of my parents.";

function translate(t) {
  const textArray = t.split("");
  const number = textArray.map((n) => {
    if (convertingNumbersToText.has(n)) {
      return convertingNumbersToText.get(n);
    }
    return n;
  });
  const textArray1 = number.join("");
  return textArray1;
}

console.log(translate(text));
