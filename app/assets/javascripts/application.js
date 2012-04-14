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

$(document).ready(function (){
	
	$('#new_user').validate({
		
		debug: true,
		onkeyup: true,
		rules: {
			'user[name]': { required: true, maxlength: 50 },
			'user[email]': { required: true, maxlength: 50, email: true },
			'user[password]': { required: true, minlength: 6 },
			'user[password_confirmation]': { required: true, equalTo: '#user_password' }
		},
		messages: {
			'user[name]': 									{ required: 'What\'s your full name?',
																				maxlength: 'Your name is not longer than 50 letters! ...And if it is, we\'re sorry.' },
			'user[email]': 									{ required: 'We need your e-mail address to create your BeerOn account.',
																			 	maxlength: 'Your e-mail address is not longer than 50 characters, and if it is... Seriously, why?',
																			 	email: 'Please enter a valid e-mail address.' },
			'user[password]': 							{ required: 'A password is required to keep your BeerOn account safe.',
																				minlength: 'Your password must be longer than 6 characters.' },
			'user[password_confirmation]': 	{ required: 'Please confirm your password.',
																				equalTo: 'Your passwords must match!' }											
		}
	});
});