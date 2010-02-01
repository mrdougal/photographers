// The public application.js

$(document).ready(function() {
	// Stuff to do as soon as the DOM is ready;
	start_slideshow();
	
});


function start_slideshow () {

	// initialise scrollable
	$("div.scrollable").scrollable();
	
	$(".items a").click(function(event) {
		
		event.preventDefault();
		
		// Find our thumbnail image (the first of the childern)
		var thumb = $(this).children().filter(":first");
		
		// Find the title
		var title = $('#slideshow h2').text($(this).attr('title'));
		
		// calculate large image's URL based on the thumbnail URL
		var image_url = thumb.attr("src").replace("tiny", "slideshow");
		var my_url = $(this).attr("href");

		// get handle to element that wraps the image and make it semitransparent
		var wrap = $("#image_wrap").fadeTo("fast", 0.75);

		// the large image
		var img = new Image();

		// call this function after it's loaded
		img.onload = function() {

			// make wrapper fully visible
			wrap.fadeTo("fast", 1);

			// change the image
			wrap.find("img").attr("src", image_url);
		
			// change the link to our own
			wrap.find("a").attr("href", my_url);

		};

		// begin loading the image
		img.src = image_url;
	
		// So that the link doesn't go to the actual page
		// return false;

	// when page loads simulate a "click" on the first image
	}).filter(":first").click();
	
}