// let currentPage = 15;
// const page = 20;

// while (currentPage <= page) {
//   console.log(currentPage++);
// }
// let currentPage = Number(prompt("Input start page"));
// const endPage = Number(prompt("Input end page"));

// while (currentPage <= endPage) {
//   if (currentPage % 2 === 0) {
//     console.log(currentPage);
//   }
//   currentPage += 1;
// }
let inputNumber = Number(prompt("Input number"));
while (!Number.isFinite(inputNumber)) {
  inputNumber = Number(prompt("Input number"));
}
console.log(`${inputNumber} ** 2 = ${inputNumber ** 2}`);
