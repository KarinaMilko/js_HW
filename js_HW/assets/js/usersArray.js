// Для
function User(id, name, surname, age, isMale, email, isSubscribed) {
  this.id = id;
  this.firstName = name;
  this.lastName = surname;
  this.age = age;
  this.isMale = isMale;
  this.email = email;
  this.isSubscribed = isSubscribed;
}

const users = [];

for (let i = 0; i < 10; i++) {
  const user = new User(
    i,
    `Username${i}`,
    `Usersurname${i}`,
    Math.floor(Math.random() * 90),
    Math.random() < 0.5,
    `useremail${i}@gmail.com`,
    Math.random() < 0.5
  );
  users.push(user);
}
console.table(users);

// * прописати метод getFullName() (повертає рядок з повним ім'ям) для користувача. Загальну логіку (тобто зазначений метод) винести в прототип.

User.prototype.getFullName = function () {
  return `${this.firstName} ${this.lastName}`;
};

// Реалізувати мінімум 4 завдання:
// Отримати масив користувачів, які не підписані (not subscribed).
function isNotSubscribed(u) {
  return !u.isSubscribed;
}

const userNotSubscribed = users.filter(isNotSubscribed);
// Вивести список повних імен користувачів.
function fullName(u) {
  document.write(`<li>${u.getFullName()}</li>`);
}
document.write("<ul>");
users.forEach(fullName);
document.write("</ul>");

// Отримати масив повних імен осіб жіночої статі шкільного віку (6 – 18 років).

function isFemale(user) {
  return !user.isMale && user.age >= 6 && user.age < 18;
}
const userFemale = users.filter(isFemale);
console.table(userFemale);

// Видалити з масиву користувача з email  useremail5@gmail.com.

const updateEmailUser = users.filter(
  (user) => user.email !== "useremail5@gmail.com"
);

// Змінити email користувачу з id 2 (можна спробувати використати find).

const findIndexUser = users.find((user) => user.id === 2);

if (findIndexUser) {
  findIndexUser.email = "oleksandr@example.com";
}

// *Впорядкувати користувачів за віком (sort).

users.sort(function (a, b) {
  return b.age - a.age;
});

// *Перевірити, чи є серед користувачів користувач з email`ом useremail7@gmail.com.

function findUserEmail(user) {
  return user.email === "useremail7@gmail.com";
}
const isUserEmail = users.some(findUserEmail);

// *Перевірити, чи всі користувачі підписані (subscribed).

function allUserSubscribed(user) {
  return user === user.length;
}
const isAllUserSubscribed = users.every(allUserSubscribed);
console.log(isAllUserSubscribed);
