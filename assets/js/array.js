// 0 Створити числовий масив та проініціалізувати його (*випадковими числами).
const arrayNumbers = [4, 8, 9, 15, 74, 15, 2, 62, 7, 3];
for (const numb of arrayNumbers) {
  console.log(numb);
}
// 1 Видалити останній і початковий елемент з масиву, додати елемент до початку і кінця.
const deleteFirstNumber = arrayNumbers.shift();
const deleteLastNumber = arrayNumbers.pop();
const inputFirstNumber = arrayNumbers.unshift(20);
const inputLastNumber = arrayNumbers.push(30);
// 2 Вивести розмір масиву.
console.log(arrayNumbers.length);
// 3 Зробити копію масиву.
const copyArrayNumbers = [...arrayNumbers];
// 4 Вивести елементи з парними індексами.
function evenIndex(index) {
  for (i = 0; i < index.length; i += 2) {
    console.log(index[i]);
  }
}
evenIndex(arrayNumbers);

// 5 Знайти добуток елементів масиву.//624335040000
function multipliesElement(numb) {
  let mult = 1;
  for (i = 0; i < numb.length; i++) {
    mult *= numb[i];
  }
  return mult;
}
console.log(multipliesElement(arrayNumbers));

// 6 Задано масив з описом телефонів з полями id, brand, model, color, price,
// RAM, ... (можна обрати будь-яку іншу сутність). Можна згенерувати дані за допомогою ШІ
const mobilePhone = [
  {
    id: 1,
    brand: "Samsung",
    model: "Galaxy S21",
    color: "Phantom Black",
    price: 9990,
    RAM: "8GB",
  },
  {
    id: 2,
    brand: "Apple",
    model: "iPhone 13",
    color: "Midnight",
    price: 10990,
    RAM: "6GB",
  },
  {
    id: 3,
    brand: "Xiaomi",
    model: "Mi 11",
    color: "Horizon Blue",
    price: 7990,
    RAM: "12GB",
  },
  {
    id: 4,
    brand: "OnePlus",
    model: "9 Pro",
    color: "Morning Mist",
    price: 8990,
    RAM: "8GB",
  },
  {
    id: 5,
    brand: "Google",
    model: "Pixel 6",
    color: "Stormy Black",
    price: 7990,
    RAM: "8GB",
  },
];

// - Сформувати розмітку для карток. (*Застилізувати картки.)
for (let i = 0; i < mobilePhone.length; i++) {
  document.write(`
  <artical>
    <h2>${mobilePhone[i].brand}</h2>
        <ul>
            <li>model: ${mobilePhone[i].model}</li>
            <li>color: ${mobilePhone[i].color}</li>
            <li>price: ${mobilePhone[i].price} UAH</li>
            <li>RAM: ${mobilePhone[i].RAM}</li>
        </ul>
  </artical>
    `);
}
// - Знайти середню ціну телефонів.//9190
function averagePrice(price) {
  let sum = 0;
  for (let i = 0; i < price.length; i++) {
    sum += price[i].price;
  }
  return sum / price.length;
}
console.log(averagePrice(mobilePhone));
// - *Знайти кількість телефонів з RAM 4, 6, 8, 12 ГБ (можна спробувати накопичити дані в об'єкт вигляду: ключ - обсяг RAM, значення - кількість телефонів з цим обсягом RAM).

// Методи перебору масивів (forEach, filter, map, findIndex, *some, *every).
// 8 Отримати новий масив із заданого, який міститиме лише ненульові числа ( => -1, 5, 9, -10). // filter
const numbers = [-1, 5, 0, 9, -10];

// function isWithoutZero(n) {
//   return n !== 0;
// }

// const numberWithoutZero = numbers.filter(isWithoutZero);

const numberWithoutZero = numbers.filter((n) => n !== 0);

// 9 Отримати новий масив їх заданого, який міститиме всі елементи вихідного, поділені на 100 (99, 5, 0, 9, 30 => 0.99, 0.05, 0, 0.09, 0.3). // map

const newNumbers = [99, 5, 0, 9, 30];

// function element(el) {
//   return el / 100;
// }

// const new100El = newNumbers.map(element);
const new100El = newNumbers.map((el) => el / 100);

// 10 Вивести елементи масиву, зведені у куб. // forEach

function printCubeNumbers(el, index, arr) {
  arr[index] = el ** 3;
}
newNumbers.forEach(printCubeNumbers);

// 11 Визначити індекс елемента, квадрат якого дорівнює 100, і видалити його, або видати діагностичне повідомлення, якщо такого елементу не існує. // findIndex
const indexNumberSqr = [2, 8, 10, 3, 7];

function isNumberSqr(el) {
  return el ** 2 === 100;
}
const findNumberSqr = indexNumberSqr.findIndex(isNumberSqr);
indexNumberSqr.splice(findNumberSqr, 1);
// 12 *Перевірити, чи всі елементи масиву є парними числами (* або простими числами). // every

// function checkNumbers(el) {
//   return el % 2 === 0;
// }
// const isEvenNumbers = indexNumberSqr.every(checkNumbers);
const isEvenNumbers = indexNumberSqr.every((el) => el % 2 === 0);

// 13 *Перевірити, чи є у масиві бодай один від'ємний елемент. // some

const isNegativeNumbers = numbers.some((el) => el < 0);
