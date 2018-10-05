Clients = {
	form: {
		formValidation: function() {
				$.validator.addMethod('emailValid', function(value, element){
        return this.optional(element) || /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$/i.test(value);
        }, 'Please enter a valid email address.');

      $.validator.addMethod('phonenoValid', function(value, element){
        return this.optional(element) || /^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$/.test(value);
        }, 'Please enter a valid Phone number.');

      $('.new_client').validate({
        rules: {
          'client[client_name]': {required: true},
          'client[client_contact]': {required: true, phonenoValid: true},
          'client[client_email]': {required: true,emailValid: true},
          'client[country]': {required: true}
        }
      });

      $('.edit_client').validate({
        rules: {
          'client[client_name]': {required: true},
          'client[client_contact]': {required: true, phonenoValid: true},
          'client[client_email]': {required: true,emailValid: true},
          'client[country]': {required: true}
        }
      });
		}
	}
}
