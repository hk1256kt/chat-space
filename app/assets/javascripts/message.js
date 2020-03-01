$(function(){ 
  function buildHTML(message){
   if ( message.image ) {
     var html =
     `<div class="main-message__box"  data-message-id=${message.id}>
          <div class="main-message__box__user">
            <div class="main-message__box__user-name">
              ${message.user_name}
            </div>
            <div class="main-message__box__user-date">
              ${message.create_at}
            </div>
            </div>
          <div class="main-message__box__text">
            ${message.content}
          </div>
            <img src=${message.image} >
       </div>`
       return html;
   } else {
     var html =
     `<div class="main-message__box"  data-message-id=${message.id}>
        <div class="main-message__box__user">
          <div class="main-message__box__user-name">
          ${message.user_name}
          </div>
      <div class="main-message__box__user-date">
        ${message.date}
      </div>
      </div>
         <div class="main-message__box__text">
        ${message.content}
        </div>
      </div>`
     return html;
   };
 }
$('#new_message').on('submit', function(e){
 e.preventDefault();
 var formData = new FormData(this);
 var url = $(this).attr('action')
 $.ajax({
   url: url,
   type: "POST",
   data: formData,
   dataType: 'json',
   processData: false,
   contentType: false
 })
  .done(function(data){
    var html = buildHTML(data);
    $('.main-message').append(html);      
    $('form')[0].reset();
    $('.main-message').animate({ scrollTop: $('.main-message')[0].scrollHeight});
    $('.main-form__box__btn').prop("disabled", false);
  })
  .fail(function() {
    alert("メッセージ送信に失敗しました");
  });
})
});