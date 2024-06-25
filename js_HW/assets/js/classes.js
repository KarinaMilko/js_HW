// 1. Реалізувати клас Post (наприклад, описує пост в соц. мережі).

// Властивості:
// id,
// назва,
// автор,
// текст,
// дата додавання,
// кількість вподобайок,
// *зображення,
// *список хештегів
class Post {
  constructor(id, title, author, text, dateAdded, likes, image, hashtags = []) {
    this.id = id;
    this.title = title;
    this.author = author;
    this.text = text;
    this.dateAdded = dateAdded;
    this.likes = likes;
    this.image = image;
    this.hashtags = hashtags;
  }
  // змінити текст поста на інший
  set text(value) {
    this._text = value;
  }
  get text() {
    return this._text;
  }
  // збільшити кількість вподобайок на 1 / зменшити кількість вподобайок на 1

  increaseLikes() {
    this.likes += 1;
  }

  reduceLikes() {
    this.likes -= 1;
  }
  // render для отримання розмітки для посту (*в методі деструктуризувати інформацію з this)

  renderPost() {
    const { id, title, author, text, dateAdded, likes, image, hashtags } = this;
    const newHashtag = hashtags.map((hashtags) => `<span>#${hashtags}</span>`);
    document.write(`
    <article>
     <h2>${id}. ${title}</h2>
      <img src = ${image} width="100" height="100">
      <p>Author: ${author}</p>
      <p>${text}</p>
    <footer>
      <p>Date: ${dateAdded}</p>
      <p>Likes: ${likes} </p>
      <p>Hashtags: ${newHashtag.join(" ")}</p> 
    </footer>
    </article>
    `);
  }

  // *сеттер з валідацією для кількості вподобайок та відповідний ґеттер.
  // *Для перевірки, чи належить кількість вподобайок певному діапазону, можна використати клас нижче.

  set likes(value) {
    if (value > 1000) {
      throw new RangeError("value must be less than 1000");
    }
    this._likes = value;
  }
  get likes() {
    return this._likes;
  }

  // *додавання хештеґу. Хештеґів у поста може бути максимум 6.
  // Можливі значення обмежені певним переліком
  // (наприклад, ['web', 'javascript', 'fullstack', 'education', тощо]).

  addHashtags(value) {
    const validHashtag = [
      "web",
      "javascript",
      "fullstack",
      "education",
      "html",
      "css",
    ];
    if (!validHashtag.includes(value) && this.hashtags.length >= 6) {
      throw new RangeError("there is no such hashtag");
    }
    this.hashtags.push(value);
  }
}

// Створити екземпляр класу, перевірити роботу методів.

const post = new Post(
  1,
  "Example Post",
  "John Doe",
  "This is an example post text.",
  "2024-06-05",
  78,
  "https://www.interviewbit.com/blog/wp-content/uploads/2021/08/javascript.jpg",
  ["javascript", "web"]
);

try {
  console.log(post);
  post.text = "Lorem ipsum dolor, sit amet consectetur adipisicing elit.";
  console.log(post);
  document.write(post.renderPost());
  post.likes = 2000;
  console.log(post.likes);
  post.addHashtags("education");
} catch (error) {
  console.log(error);
}

// *Створити масив постів (достатньо 2-3), тобто елементами масиву будуть екземпляри класу.
// Відрендерити ці пости (перебравши масив).

const posts = [
  new Post(
    2,
    "Example Post CSS",
    "Test",
    "This is an example post text.",
    "2024-06-05",
    1000,
    "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/CSS3_logo_and_wordmark.svg/800px-CSS3_logo_and_wordmark.svg.png",
    ["javascript", "web", "css"]
  ),
  new Post(
    3,
    "Example Post WEB",
    "Test",
    "This is an example post text.",
    "2024-06-05",
    400,
    "https://fineproxy.org/wp-content/uploads/2023/05/World-Wide-Web-WWW.jpg",
    ["javascript", "web", "education", "html", "css"]
  ),
  new Post(
    4,
    "Example Post HTML",
    "Test",
    "This is an example post text.",
    "2024-06-05",
    870,
    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/1024px-HTML5_logo_and_wordmark.svg.png",
    ["javascript", "web", "education", "html"]
  ),
];
posts.forEach((post) => post.renderPost());
posts.forEach((post) => console.log(post));
