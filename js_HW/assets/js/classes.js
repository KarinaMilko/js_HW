class Post {
  constructor(id, title, author, text, dateAdded, likes, image, hashtags) {
    this._id = id;
    this._title = title;
    this._author = author;
    this._text = text;
    this._dateAdded = dateAdded;
    this._likes = likes;
    this._image = image;
    this._hashtags = hashtags;
  }
  set text(value) {
    this._text = value;
  }
  get text() {
    return this._text;
  }
  set likes(value) {
    if (value < 1000) {
      return (value = this._likes);
    } else {
      throw new RangeError("value must be less than 1000");
    }
  }
  get likes() {
    return this._likes + 1;
  }

  // renderPost({ id, title, author, text, dateAdded, likes, image, hashtags }) {
  //   document.write(`
  //    <article>
  //      <h2>${id}. ${title}</h2>
  //        <img src = ${image}>
  //        <p>${author}</p>
  //        <p>${text}</p>
  //      <footer>${dateAdded} ${likes} ${hashtags}</footer>
  //    </article>
  //   `);
  // }
  renderPost() {
    document.write(`
     <article>
       <h2>${this._id}. ${this._title}</h2>
         <img src = ${this._image}>
         <p>${this._author}</p>
         <p>${this._text}</p>
       <footer>${this._dateAdded} ${this._likes} ${this._hashtags}</footer>
     </article>
    `);
  }
  set hashtags(value) {
    const VALID_HASHTAG = ["web", "javascript", "fullstack", "education"];
    if (!VALID_HASHTAG.includes(value)) {
      throw new RangeError("there is no such hashtag");
    }
    this._hashtags = value;
  }
  get hashtags() {
    return this._hashtags;
  }
}

try {
  const post = new Post(
    1,
    "Example Post",
    "John Doe",
    "This is an example post text.",
    "2024-06-05",
    100,
    "https://www.interviewbit.com/blog/wp-content/uploads/2021/08/javascript.jpg",
    ["example", "post", "javascript"]
  );

  console.log(post);
  post.text = "Lorem ipsum dolor, sit amet consectetur adipisicing elit.";
  console.log(post);
  console.log(post.likes);
  post.likes = 100;
  post.renderPost();
  // post.hashtags = "post";
  console.log(post.hashtags);
} catch (error) {
  console.log(error);
}
