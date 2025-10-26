// // Завдання на if
// // 1
const isDay = true;

if (isDay) {
  document.write(
    `<p><span style="color:black; background:lightgrey"<span/>"Світла тема"</p>`
  );
} else {
  document.write(
    `<p><span style="color:white; background:black"><span/>"Темна тема"</p>`
  );
}

// // // 2
const isOnline = true;
const status = isOnline
  ? " "
  : "Ваше повідомлення буде відправлено при під'єднанні до мережі Інтернет";

document.write(status);

// // 3
let price = 800;
const discount1 = 3;
const discount2 = 5;

if (price >= 500 && price < 800) {
  console.log(price - (price * discount1) / 100);
} else if (price >= 800) {
  console.log(price - (price * discount2) / 100);
} else {
  console.log(price);
}

// // 4
const isLogin = false;
const name = prompt("Input name");
const photo = `https://wiki.legalaid.gov.ua/images/e/e2/Person1.jpg`;
const logo = `https://cdn6.aptoide.com/imgs/5/d/1/5d187923c2f94bf506bc9444ddf02516_icon.png`;

let authBlock = "";

if (isLogin) {
  authBlock = `
   <div class="user">
  <img class="user-img" src="${photo}" alt="photo">
  <p class="user-name">${name}</p>
  </div>`;
} else {
  authBlock = `
    <div class="btm">
  <bottom class="btm-log">Login</bottom>
  <bottom class="btm-reg">Register</bottom>
  </div>`;
}
document.write(`
<header class="main-head">
<div class="main-nav">
<img class="logo-img" src="${logo}" alt="photo">
${authBlock}
<div/>
</header>`);

// Завдання на switch..case
// 1
const dayNumber = +prompt("Номер дня тижня: ");
switch (dayNumber) {
  case 1:
    alert("Понеділок");
    break;

  case 2:
    alert("Вівторок");
    break;

  case 3:
    alert("Середа");
    break;

  case 4:
    alert("Четвер");
    break;

  case 5:
    alert("П'ятниця");
    break;

  case 6:
    alert("Субота");
    break;

  case 7:
    alert("Неділя");
    break;

  default:
    alert("дня з таким номером не існує");
// }
// 2
const dayMonth = +prompt("Введіть день місяця");
switch (dayMonth) {
  case 1:
  case 2:
  case 3:
  case 4:
  case 5:
  case 6:
  case 7:
  case 8:
  case 9:
  case 10:
    alert("перша декада");
    break;

  case 11:
  case 12:
  case 13:
  case 14:
  case 15:
  case 16:
  case 17:
  case 18:
  case 19:
  case 20:
    alert("друга декада");
    break;

  case 21:
  case 22:
  case 23:
  case 24:
  case 25:
  case 26:
  case 27:
  case 28:
  case 29:
  case 30:
  case 31:
    alert("третя декада");
    break;
  default:
    alert("дня з таким номером не існує");
}
