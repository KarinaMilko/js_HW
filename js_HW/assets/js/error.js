// 1. Для рекурсивної функції піднесення числа до степеня pow(base, exponent)
// реалізувати валідацію значень, що передаються, і генерацію помилок відповідних типів.
// Виклик функції вкласти в блок try з відловом виняткових ситуацій (помилок)
// різних типів з оповіщенням користувача про тип помилки.

function pow1(base, exponent) {
  if (typeof base !== "number" || typeof exponent !== "number") {
    throw new TypeError("Value must be a number");
  }

  if (!Number.isInteger(base)) {
    throw new TypeError("Value must be an integer");
  }
  if (exponent < 0) {
    throw new RangeError("Value must be a positive");
  }
  function p(base, exponent) {
    if (exponent === 0) {
      return 1;
    }
    return base * p(base, exponent - 1);
  }

  return p(base, exponent);
}

try {
  console.log(pow1(2, 1));
} catch (error) {
  if (error instanceof TypeError) {
    console.log("TypeError: Value must be a number and an integer");
  } else if (error instanceof RangeError) {
    console.log("RangeError: Value must be a positive");
  } else {
    console.log("Error");
  }
}

// Для спрощення замість рекурсивного алгоритму можна реалізувати
//  повернення значення base**exponent, основу base вважайте цілим числом,
// показник exponent -- додатнім, реалізувати тільки те, що стосується роботи з помилками.

function pow(base, exponent) {
  if (typeof base !== "number" || typeof exponent !== "number") {
    throw new TypeError("Value must be a number");
  }

  if (!Number.isInteger(base)) {
    throw new TypeError("Value must be an integer");
  }
  if (exponent < 0) {
    throw new RangeError("Value must be a positive");
  }
  return base ** exponent;
}

try {
  console.log(pow("7", 2));
} catch (error) {
  console.log("error :>> ", error);
}

// 2. *Реалізувати функцію для валідації імейлу.
// Імейл має бути рядком і містити символ "@", цей символ не має бути першим або останнім.

function email(em) {
  if (typeof em !== "string") {
    throw new TypeError("Email must be a string");
  }
  if (em.startsWith("@") || em.endsWith("@")) {
    throw new RangeError("@ must be in the middle of the Email");
  }

  return em;
}

try {
  console.log(email("useremail5gmail.com@"));
} catch (error) {
  console.log("error :>> ", error);
}
