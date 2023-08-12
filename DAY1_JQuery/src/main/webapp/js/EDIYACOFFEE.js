$(document).ready(function() {
    $('nav li').hover(function() {
      $(this).children('.sub').stop().slideDown(200);
    }, function() {
      $(this).children('.sub').stop().slideUp(200);
    });
  });

  
  