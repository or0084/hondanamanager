$(function(){
  $('#form').validate({
    rules: {
      "user[name]": {
        required: true,
      },
    },
  })
})