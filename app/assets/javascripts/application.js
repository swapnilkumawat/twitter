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
  $(".tweet-input, .reply-input").keyup(function(){
    if ($('.tweet-input, .reply-input').val().length > 0) {
      $(".mid-tweet, .mid-reply").css("cursor","pointer");
      $(".mid-tweet, .mid-reply").css("opacity","1");
      $(".mid-tweet, .mid-reply").removeClass('disabled');
    } else {
      $(".mid-tweet, .mid-reply").css("cursor","default");
      $(".mid-tweet, .mid-reply").css("opacity","0.6");
      $(".mid-tweet, .mid-reply").addClass('disabled');
    }
  });

  $(".fav").click(function(){
    var tweet_id = $(this).find('input').val();
    $.ajax({
      type: 'POST',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: '/tweets/' + tweet_id + '/likes',
      data: {},
      dataType: "script",
      success: function () {
      },
      error: function () {
      }
    });
  });

  $(".rt").click(function(){
    $(this).css("color","rgb(48, 185, 48)");
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

  $('.mid-reply').click(function(){
    var tweet_id = $('.tweet-id').val()
    var content = $('.reply-input').val();
    $.ajax({
      type: 'POST',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: '/tweets/' + tweet_id + '/comments',
      data: { 'content': content },
      dataType: "script",
      success: function () {
      },
      error: function () {
      }
    });
  });
});