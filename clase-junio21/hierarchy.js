// Implementar la siguiente jetatquía de objetos
//Person
//  -name
//  -lastName
//  User
//    -username
//    -password
//    Customer
//      -contracts
//    Employee
//      -salary
//    Manager
//      -subordinates


// User < Person
// Customer < User
// Employee < User
// Manager < Employee

function Person (attrs){
  this.name = attrs.name;
}

function User (attrs){
  Person.call(this, attrs);
//  this.password = password;
}

User.prototype = Object.create(Person.prototype)
User.prototype.constructor = User


function Employee (attrs){
  User.call(this, attrs);
}

Employee.prototype = Object.create(User.prototype)
Employee.prototype.constructor = Employee

function Manager (attrs){
  Employee.call(this, attrs)
}

Manager.prototype = Object.create(Employee.prototype)
Manager.prototype.constructor = Manager


var man = new Manager({
  salary: 1000000,
  username: 'Jefecito',
  name: 'The boss'
})

--------------------------------------------------
function sayHi(var1) {
  return 'Hi ' + var1
}

function sayBye (var1) {
  return 'Bye ' + var1
}

function sayHiAndBye (fun1, fun2, var1){
  return fun1(var1) + ' ' + fun2(var1)
}
//Esto es lo mismo

function sayHiAndByw (fun1, fun2, var1){
  return fun1.call(null,var1)+ ' ' +fun2.call(null,var1)
}

// Tambien
function sayHi() {
  return 'Hi ' + this.name
}

function sayBye () {
  return 'Bye ' + this.name
}
function sayHiAndBye (fun1, fun2, var1){
  return fun1.call(var1)+ ' ' +fun2.call(var1)
}

sayHiAndBye(sayHi, sayBye, {name: 'David'})

------Ejercicio map manual---------

function byTwo (num){
  return num*2;
}
function manualMap(fun, array){
  var con = 0
  var narr = []
  while (con <= array.length-1){
    narr.push(fun(array[con]))
    con++
  }
  return narr
}

manualMap(function(elem){return elem**3}, [1, 2, 3, 4, 5])

----------Ejercicio forEach manual -------------------

function myForEach (array, func){
  for (var i = 0; i < array.length; i++){
    func(array[i], i)
  }
}

myForEach([1, 2, 3, 4, 5], function(elem, index){
  console.log('Array[%s] = %s', index, elem)
})
----------------------------------------------


function myFilterSum (arr, fun){
  var sum = 0
  arr.forEach(function(elem){
    if (fun(elem)){
      sum += elem
    }
  })
  return sum
}

function myFilter (arr, fun){
  var nar = []
  arr.forEach(function(elem){
    if (fun(elem)){
      nar.push(elem)
    }
  })
  return nar
}
-----------------------------------------------
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
