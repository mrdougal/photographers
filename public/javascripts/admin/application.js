// Javascript for when we're in the admin section of the website

$(document).ready(function() {

	// Stuff to do as soon as the DOM is ready;
	attach_confirmation_to_public_links();
	highlight_flash();

});


function attach_confirmation_to_public_links () {

	// Find all links, and filter out the ones which don't point to within the admin section
	$('a').filter(':not([href*="admin"])').each(function() {

		// This will attach a javascript prompt for when the link is clicked
		$(this).bind('click', function() {

			// If the link is to the logout, attach a different message
			if ($(this).attr('pathname') == '/logout') {
				return confirm('You sure you want to logout?')
			} else{
				return confirm('This will take you out of the admin section of the website');
			};
		});
	})
}

function highlight_flash () {
	
	// Find and highlight the flash
	$('#flash .flash').effect('highlight', {}, 1000);
}