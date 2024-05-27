// 1) Реалізувати функцію isWorkingAgePerson, яка буде перевіряти, чи працездатного людина віку (наприклад, від 16 до 64)

/**
 * @function isWorkingAgePerson
 * @param {number} age - Working age
 * @returns
 */

function isWorkingAgePerson(age) {
  return age > 16 && age < 64;
}

console.log(isWorkingAgePerson(20));
console.log(isWorkingAgePerson(4));
console.log(isWorkingAgePerson(88));

// 2) Реалізувати функцію checkMultiplicity, яка приймає два числа і перевіряє, чи ділиться перше на друге націло (без залишку)

/**
 *
 * @param {number} firstNumber
 * @param {number} secondNumber
 * @returns - Check multiplicity
 */

function checkMultiplicity(firstNumber, secondNumber) {
  return firstNumber % secondNumber === 0;
}

console.log(checkMultiplicity(25, 5));
console.log(checkMultiplicity(15, 3));
console.log(checkMultiplicity(15, 5));
console.log(checkMultiplicity(15, 4));

// 3) Перевірка можливості існування трикутника

function isTriangle(firstSide, secondSide, thirdSide) {
  return (
    firstSide + secondSide >= thirdSide &&
    firstSide + thirdSide >= secondSide &&
    secondSide + thirdSide >= firstSide &&
    firstSide > 0 &&
    secondSide > 0 &&
    thirdSide > 0
  );
}
console.log(isTriangle(2, 4, 8));
console.log(isTriangle(2, 4, 5));
console.log(isTriangle(0, 4, 5));
console.log(isTriangle(5, 4, 1));

const firstSide1 = +prompt("Input first side of triangle");
const secondSide1 = +prompt("Input second side of triangle");
const thirdSide1 = +prompt("Input third side of triangle");

function isTriangle1(firstSide1, secondSide1, thirdSide1) {
  if (
    firstSide1 + secondSide1 >= thirdSide1 &&
    firstSide1 + thirdSide1 >= secondSide1 &&
    secondSide1 + thirdSide1 >= firstSide1 &&
    firstSide1 > 0 &&
    secondSide1 > 0 &&
    thirdSide1 > 0
  ) {
    return document.write(`<p>It's a Triangle</p>`);
  } else {
    return document.write(`<p>It isn't a Triangle</p>`);
  }
}
isTriangle1(firstSide1, secondSide1, thirdSide1);

// 4 Реалізувати функції розрахунку площі трикутника/

const sideTriangle = 4;
const heightTriangle = 6;

const areaTriangle = function (sideTriangle, heightTriangle) {
  return (sideTriangle * heightTriangle) / 2;
};
console.log(areaTriangle(2, 5));
console.log(areaTriangle(7, 10));
document.write(
  `<p>Area of a triangle: ${areaTriangle(sideTriangle, heightTriangle)}</p>`
);

// Реалізувати функції розрахунку площі прямокутника

const areaRectangle = function (widthTriangle, heightRectangle) {
  return widthTriangle * heightRectangle;
};
console.log(areaRectangle(5, 4));
