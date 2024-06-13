// Реалізувати ієрархію класів:
// ПасажирськийТранспорт (PassengerTransport) =>ТранспортнийЗасіб (Vehicle)
// (За бажанням:) Вантажний Транспорт (FreightTransport) => ТранспортнийЗасіб (Vehicle).

// Для базового класу Vehicle реалізувати:

// - властивості:
// --- dimensions - габарити (об'єкт із довжиною, шириною, висотою),
// --- brand - марка,
// --- model - модель,
// --- manufactureDate - дата виробництва (використовувати вбудований об'єкт Date).

// - методи:
// --- getFullInfo() - повертає рядок з інформацією про транспортний засіб: бренд, модель, вік;
// --- getAge() - повертає кількість років із дня виробництва (буде плюсом реалізувати геттером).

class Vehicle {
  constructor(dimensions, brand, model, manufactureDate) {
    this.dimensions = dimensions;
    this.brand = brand;
    this.model = model;
    this.manufactureDate = manufactureDate;
  }
  getFullInfo() {
    return `Brand: ${this.brand}, model: ${this.model}, ${this.manufactureDate} year`;
  }
  getAge() {
    return new Date().getFullYear() - this.manufactureDate;
  }
}

// Дочірній клас PassengerTransport розширюється:

// - властивостями:
// --- passengerLimit - максимальна кількість пасажирських місць,
// --- passengerCount - кількість зайнятих пасажирських місць,

// - методом addPassenger() - додає ще одного пасажира, якщо ще є вільні місця;
// повертає true (якщо пасажир доданий) або false (якщо не доданий, тобто вже не було вільних місць).

// Перевизначити метод getFullInfo: повертає рядок з інформацією про транспортний засіб:
// бренд,
// модель,
// вік,
// максимальна кількість пасажирських місць.

class PassengerTransport extends Vehicle {
  constructor(
    dimensions,
    brand,
    model,
    manufactureDate,
    passengerLimit,
    passengerCount
  ) {
    super(dimensions, brand, model, manufactureDate);
    this.passengerLimit = passengerLimit;
    this.passengerCount = passengerCount;
  }
  addPassenger() {
    if (this.passengerCount <= this.passengerLimit) {
      this.passengerCount++;
      return true;
    } else {
      return false;
    }
  }
  getFullInfo() {
    return `${super.getFullInfo()}, passenger limit: ${
      this.passengerLimit
    } persons`;
  }
}

const passengerTransport1 = new PassengerTransport(
  "6.2 meters long, 2.5 meters wide, 2.8 meters tall",
  "Mercedes-Benz",
  " Sprinter",
  2020,
  15,
  25
);
console.log(passengerTransport1);
console.log(passengerTransport1.getAge());
console.log(passengerTransport1.getFullInfo());
console.log(passengerTransport1.addPassenger());
// (За бажанням:)
// Дочірній клас FreightTransport розширюється:

// - властивістю:
// --- capacity - вантажопідйомність,

// - методом checkLoadingPossibility(weight) - перевіряє, чи можна завантажити масу weight.
// Повертає boolean.

// Перевизначити метод getFullInfo:
// бренд,
// модель,
// вік,
// вантажопідйомність.

// Створити об'єкти всіх класів ієрархії, протестувати роботу методів.

class FreightTransport extends Vehicle {
  constructor(dimensions, brand, model, manufactureDate, capacity, weight) {
    super(dimensions, brand, model, manufactureDate);
    this.capacity = capacity;
    this.weight = weight;
  }
  checkLoadingPossibility() {
    if (this.weight <= this.capacity) {
      return true;
    } else {
      return false;
    }
  }
  getFullInfo() {
    return `${super.getFullInfo()}, capacity: ${this.capacity} kg`;
  }
}
const freightTransport1 = new FreightTransport(
  "height: 3.2, width: 2.5, length: 12",
  "Mercedes-Benz",
  "Actros",
  2015,
  30000,
  20000
);
console.log(freightTransport1);
console.log(freightTransport1.checkLoadingPossibility());
console.log(freightTransport1.getFullInfo());
