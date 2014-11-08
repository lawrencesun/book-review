// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.atwho
//= require_tree .
//= require bootstrap-sprockets
//= require nprogress
//= require turbolinks

$(document).on('page:fetch',   function() { NProgress.start(); });
$(document).on('page:change',  function() { NProgress.done(); });
$(document).on('page:restore', function() { NProgress.remove(); });

    
$(function(){
  commenter = [];
	commenter_exist= [];
	$('.comment-user').each(function() {
  	if($.inArray($(this).text(), commenter_exist) < 0){
      commenter.push($(this).text());
      commenter_exist.push($(this).text());
    }
	});
  $('textarea').atwho({at:"@", 'data':commenter});
});
