// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .


// Pinterest layouting
function initLayout(){
  var window_width = $('.main').width();
  wrapper_width = Math.floor( window_width / 236 ) * 236;
  if ( window_width > 960 ) {
    $('.wrapper').css("width", wrapper_width + "px" );
  } else {
    $('.wrapper').css("width", "944px" );
  }
}

function resort() {
  $('#pinterest').masonry({
    itemSelector : '.item',
    isResizable: false
  });
}

function trigger_pinterest() {
  $(function(){
    initLayout();
    resort();
  });

  $(window).resize(function(){
    initLayout();
    resort();
  });
}




// will_paginate override to create an endless scroll
$(document).ready(function() {

  if ( $('.pagination').length ) {

    $(window).scroll(function() {

      url = $('.pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 200) {
        $('.pagination').text("Fetching more items...");
        $.getScript(url);
      }

    });
    $(window).scroll();

  }

  if ( $('#etalage').length ) {
    $('#etalage').etalage();
  }

});