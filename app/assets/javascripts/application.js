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
//= require_tree .
//
//
function addtocart(productid)
{
	$.post('/cart/new', {product:productid});
}

function highlight(id)
{
 	
}

$(document).ready(function(){

	var msg = $('#notification-bar .flash');
	if(!!msg)
		showNotification(msg.text());
	
});

$(document).ajaxComplete(function(event, request){
	//type = request.getResponseHeader("X-Message-Type");
	showNotification(request.getResponseHeader("X-Message"));
});

var showNotification = function(text)
{
	if(!text)
		return;
	
	$('#notification-bar')
	.attr('class', 'notify')
	.html(text)
	.slideDown(1000)
	.delay(2000)
	.fadeOut(1500);
}