function reverseNumber(num){
  final = ''
  a = String(num).split('')
  a.forEach(function (value, index) {
    final = value + final
  })
  return final
}

Solucion

function reverseNumber(num){
  //return String(num).split('').reverse().join('')
  return parseInt(String(num).split('').reverse().join(''), 10) // Lo devuelve en numero, el 10 del final es para especificar que esta en base 10
}

--------------------------------
// Primero se definen las variables y luego se hacen los metodos
function test() {
  var a;
  function foo() {
    return 2;
  }

  console.log(a)
  console.log(foo());

  a = 1;
}
-------------------------------------

function eachWordToUpperCase (str) {
  return str.split(' ').map(function (word) {
    var char = word.charAt(0).toUpperCase()
    return char + word.slice(1)
  }).join(' ')
}
---------------------------------------
//Listar los no leidos
 var library = [
   {
     title: 'Bill Gates',
     author: 'The Road Ahead',
     wasRead: true
   },
   {
     title: 'Steve Jobs',
     author: 'Walter Isaacson',
     wasRead: true
   },
   {
     title: 'Mockingjay: The Final Book Of The Hunger Games',
     author: 'Suzanne Collins',
     wasRead: false
   }
 ]

 function unReadBooks(arr){
   arr.forEach (function (value, index) {
     if (value['wasRead'] === false){
        console.log(value.title + ' no ha sido leido')
      }
    })
 }

---------------------------------------------
function clear (arr) {
  while (arr.length > 0){
    arr.pop();
  }
  return arr
}
---------------------------------------------
for( var x = 0; x < arr.length; x++){
  console.log('ELEM = ', arr[x])
}
--------------------------------------------
var book = {
    title: 'Bill Gates',
    author: 'The Road Ahead',
    wasRead: true
  }

  delete book.author // Se le pueden quitar los atributos a un objeto
----------------------------------------------
var student = {
  name: "David Rayy",
  sclass: "VI",
  rollno: 12,
  birthdate: new Date()
}

function allValues(hash) {
  var array_keys = new Array();
  var array_values = new Array();
  for (var key in hash) {
    array_keys.push(key);
    array_values.push(hash[key]);
  }
  array_keys.forEach (function(value, index){
    console.log('obj['+ value + '] = ' + hash[value])
  })

Solucion Simon

function values(obj){
  Object.keys(obj).forEach(function (key){
    console.log('obj[%s] = %s', key, obj[key])
  })
}
------------------------------------------------------
// Ordenar por libraryID
var library = [
  {
    title: 'Bill Gates',
    author: 'The Road Ahead',
    libraryID: 3446
  },
  {
    title: 'Steve Jobs',
    author: 'Walter Isaacson',
    libraryID: 3322
  },
  {
    title: 'Mockingjay: The Final Book Of The Hunger Games',
    author: 'Suzanne Collins',
    libraryID: 3678
  }
]

library.sort(finction (book1,book2){
  return (book1.libraryID - book2.libraryID)
})

-------- Clase martes 20 de Junio -----------

function User (name, email) {
  this.name = name;
  this.email = email;
  this.getName = function(){
    return this.name;
  }
}

User.prototype.getEmail = function (){
  return this.email
}

Array.prototype.avarage = function (){
  var sum = 0
  this.forEach (function (value){
    sum += value
  })
  return sum/this.length
}

var comment = {
  title: '',
  content: '',
  titleCapitalized: function () {
    return this.title.toUpperCase()
  }
}

--Ejercicio--

var fullName = 'John Doe'
var obj = {
  fullName: 'Colin Ihrig',
  prop: {
    fullName: 'Aurelio De Rosa',
    getFullname: function() {
      return this.fullName;
    }
  }
}

console.log(obj.prop.getFullname())

-- Ejercicio Blog-Author-Posts-comments ---

  function Author(name){
    this.name = name
    this.posts = []
    this.addPost = function (post){
      this.posts.push(post)
    }
    this.getPosts = function(){
      return this.posts
    }
  }

  function Post(title, content){
    this.title = title
    this.content = content
    this.comments = []
    this.addComment = function (comment){
      this.comments.push(comment)
    }
    this.getComments = function(){
      return this.comments
    }
  }

  function Comment(text){
    this.text = text
  }


Solucion Simón

function PostNotFoundError (message) {
  this.message = message
  Error.captureStackTrace(this, this.constructor)
}
PostNotFoundError.prototype = Object.create(Error.prototype)
PostNotFoundError.prototype.constructor = PostNotFoundError

function Author(email) {
  this.email = email
  this.posts = []
  this.locked = false
}
Author.prototype.lockPosts = function () {this.locked = true}
Author.prototype.unlockPosts = function () {this.locked = false}

Author.prototype.createPost = function (post) {
  if (this.locked === true){
    throw new Error('You cannot create posts because this srevice is locked')
  } else {
  post.setAuthor(this)
  this.posts.push(post)
  }
}
Author.prototype.getPosts = function (){return this.posts}

Author.prototype.findPostsByTitle = function (title) {
  var found = this.posts.find(function (post){
    return post.title === title
  })
  if (!found) {
    throw new Error('Post not found')
  } else {
    return found
  }
}

function Post(attrs) {
  this.title = attrs.title
  this.content = attrs.content
  this.author = attrs.author
  this.comments = []
}
Post.prototype.setAuthor = function (author) {
  this.author = author
}
Post.prototype.addComment = function (comment) {
  this.comments.push(comment)
}
Post.prototype.getComments= function () {
  return this.comments
}

function Comment(text) {
  this.text = text
}

var p1 = new Post({
  title: 'The lord of the rings',
  content: 'afh,adjhdf'
})
var p2 = new Post({
  title: 'Harry Potter',
  content: 'jajajaja'
})

var author = new Author('lorenzo@ex.com')
author.createPost(p1)
author.createPost(p2)

var comment1 = new Comment('qwertyuio')
var comment2 = new Comment('12345678')

p1.addComment(comment1)
p2.addComment(comment2)

try{
  author.findPostByTitle('The lord of')
} catch (error) {
  if (error instanceof PostNotFoundError){
  console.log('MESSAGE: ', error.message)
  console.log('STACK: ', error.stack)
  } else {
  throw error
  }
}

--------------------------------------
funciones con strings

slice
splice
substr
substring
replace
