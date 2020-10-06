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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery.slick
//= require bootstrap-sprockets
//= require_tree .

$(function() {
  $('.slider').slick({
      dots: true,
      autoplay: true,
      autoplaySpeed: 3000,
      speed: 1000,
      fade: true,
      pauseOnHover: false,
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.slider').slick('goTo', $(this).index());
  });
});

$(function(){
  $('.homes-top-animation').delay(2000).fadeOut(1000);
});

$(function(){
  var $title = $('.homes-top-title');
  var $words = $('.homes-top-title').html().split("");
  $('.homes-top-title').html("");
  $.each($words, function(index, element){
    var newEl = $("<span/>").text(element).css({ opacity: 0 });
    newEl.appendTo($title);
    newEl.delay(index * 70);
    newEl.animate({ opacity: 1 }, 1000);
  });
});

$(function() {
  $('#arrow-button a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});

$(function() {
  $('.menu-trigger').on('click', function(event) {
    $(this).toggleClass('active');
    $('.sp-menu').fadeToggle();
    event.preventDefault();
  });
});