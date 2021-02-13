// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require_tree .

$(document).ready(function(){
  $(".tweet-input").keyup(function(){
    if ($('.tweet-input').val().length > 0) {
      $(".mid-tweet").css("cursor","pointer");
      $(".mid-tweet").css("opacity","1");
      $('.mid-tweet').removeClass('disabled');
    } else {
      $(".mid-tweet").css("cursor","default");
      $(".mid-tweet").css("opacity","0.6");
      $('.mid-tweet').addClass('disabled');
    }
  });

  $('.mid-tweet').click(function(){
    var content = $('.tweet-input').val();
    $.ajax({
      type: 'POST',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: '/tweets',
      data: { 'content': content },
      dataType: "script",
      success: function () {
      },
      error: function () {
      }
    });
  });
});