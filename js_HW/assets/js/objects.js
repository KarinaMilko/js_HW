// 1. Створити об'єкт customer

const customer = {
  nameCustomer: "Karina",
  lastNameCustomer: "Milko",
  emailCustomer: "milkokarina13@gmail.com",
  passwordCustomer: "123415",
  phoneCustomer: "0681112233",
  adressCustomer: {
    cityCustomer: "Zaporizhzhia",
    streetCustomer: "Sadova",
    houseCustomer: "5",
  },
};
console.log(customer.adressCustomer);
document.write(
  `<p>Adress customer: ${customer.adressCustomer.cityCustomer}, ${customer.adressCustomer.streetCustomer}, ${customer.adressCustomer.houseCustomer}</p>`
);
customer.phoneCustomer = "0969994477";
customer.isMail = false;
delete customer.adressCustomer;

const copyCustomer = Object.assign({}, customer);
console.log("copyCustomer===customer:>> ", copyCustomer === customer);

const copyCustomer1 = { ...customer };
console.log("copyCustomer1===customer:>> ", copyCustomer === customer);

// 1. методи:
// виведення адреси,
// зміна номера телефону (метод повинен приймати як параметр рядок з новим номером телефону).

const customer1 = {
  nameCustomer: "Karina1",
  lastNameCustomer: "Milko1",
  emailCustomer: "milkokarina@gmail.com",
  passwordCustomer: "123415",
  phoneCustomer: "0681112233",

  adressCustomer: {
    cityCustomer: "Kyiv",
    streetCustomer: "Sadova",
    houseCustomer: "6",
  },
  getAdress() {
    return `${this.adressCustomer.cityCustomer}, ${this.adressCustomer.streetCustomer}, ${this.adressCustomer.houseCustomer}`;
  },
  changePhone(newPhone) {
    this.phoneCustomer = newPhone;
  },
};

console.log(customer1.getAdress());
document.write(`<p>Customer adress: ${customer1.getAdress()}</p>`);

customer1.changePhone(prompt("Input new phone"));
console.log("customer1 :>> ", customer1);

// 2. Перебрати і вивести властивості об'єкту cat
const cat = {
  name: "Murka",
  color: "black",
  isMale: false,
  isFurnitureDemage: true,
};
for (const key in cat) {
  console.log("key :>> ", key, cat[key]);
}
console.dir(cat);

// 3. Створити функцію-конструктор для створення об'єктів книг з властивостями

function Books(author, nameBook, yearPublication, publishingHouse, price) {
  this.authorBook = author;
  this.name = nameBook;
  this.year = yearPublication;
  this.publish = publishingHouse;
  this.price = price;
  this.getAge = function () {
    return new Date().getFullYear() - this.year;
  };
  this.changePrice = function (newPrice) {
    this.price = newPrice;
  };
}

const book1 = new Books(
  "Arthur Conan Doyle",
  "The Adventures of Sherlock Holmes",
  2020,
  " Penguin Books Ltd",
  35
);
// Передбачити методи:
// для зміни ціни книги

book1.changePrice(50);
console.log("book1 :>> ", book1);

// Передбачити методи:
// для обчислення віку книги (у роках)

document.write(`<p>Book age (in years): ${book1.getAge()}</p>`);
