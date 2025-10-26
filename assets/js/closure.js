// Змініть приклад із заняття по замиканню (counter) так,
// щоб при кожному виклику значення лічильника змінювалося не на 1,
// а на передане користувачем число
// (передати його при виклику зовнішньої функції customCounter).

// Приклад використання:
// const myCounter = customCounter1(5);
// const result1 = myCounter(); // => 5
// const result2 = myCounter(); // => 10
// const result3 = myCounter(); // => 15

function customCounter1(num) {
  let count = 0;
  function customCounter() {
    return (count += num);
  }
  return customCounter;
}

const myCounter = customCounter1(5);

const result1 = myCounter();
const result2 = myCounter();
const result3 = myCounter();
console.log(result1);
console.log(result2);
console.log(result3);

// Або:

// * Змініть приклад із заняття по замиканню (counter) так,
// щоб користувач задавав початкове значення лічильника
// (у прикладі із заняття це 0) і крок зміни лічильника
// (у прикладі із заняття це 1).

// Приклад використання:
// const myCounter = customCounter2 (1, 5);
// const result1 = myCounter(); // => 6
// const result2 = myCounter(); // => 11
// const result3 = myCounter(); // => 16
//num=1 step=5  1+5=6  6+5=11  11+5=16

function customCounter2(num, step) {
  let count = num;
  debugger;
  function customCounter() {
    return (count += step);
  }
  return customCounter;
}

const myCounter2 = customCounter2(1, 5);

const result4 = myCounter2();
const result5 = myCounter2();
const result6 = myCounter2();
console.log(result4);
console.log(result5);
console.log(result6);

// У ДЕБАГЕРІ відстежити змінні, які перебувають у Замиканні (Closure).
