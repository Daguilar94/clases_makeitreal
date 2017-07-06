function PostView(){
  $('.new_post').on('submit', function(event) {
    alert('CATCH')
    var titleLen = $('#title-field').val().length
    var contentLen = $('#content-field').val().length

    if (titleLen === 0 || contentLen === 0){
      alert('title and content can not be blank')
      event.preventDefault()
    }
    if (titleLen > 100){
      alert('Title must be up to  100 char')
      event.preventDefault()
    }
    if (contentLen > 140){
      alert('content must be up to 140 char')
      event.preventDefault()
    }
  })
}
