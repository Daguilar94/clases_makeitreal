$.ajax({
url: 'localhost:3000/products',
method: 'Get', //POST, PUT, PATCH, DELETE
data: {},
accept: 'application/json',
headers: {
  contentType: 'application/json',
  authorization: 'TOKEN'
  }
//  success: function() {},
//  error: function() {},
//  complete: function() {}
})
.done(function(data, status, XHR) {})
.fail(function(XHR, status, error) {})
.always(function () {})

//fixer.io
