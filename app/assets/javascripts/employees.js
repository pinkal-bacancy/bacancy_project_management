Employees = {
	form: {
		formValidation: function() {
				$.validator.addMethod('emailValid', function(value, element){
        return this.optional(element) || /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$/i.test(value);
        }, 'Please enter a valid email address.');

      $.validator.addMethod('passwordValid', function(value, element){
        return this.optional(element) || /^(?=.*\d).{8,}$/.test(value);
        }, 'Password must have eight characters, and at least one numberal.');

      $.validator.addMethod('phonenoValid', function(value, element){
        return this.optional(element) || /^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$/.test(value);
        }, 'Please enter a valid Phone number.');

      $.validator.addMethod('costValid', function(value, element){
        return this.optional(element) || /^(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(value);
        }, 'Please enter a valid cost.');
      $('.new_employee').validate({
        rules: {
          'employee[first_name]': {required: true},
          'employee[last_name]': {required: true},
          'employee[username]': {required: true},
          'employee[email]': {required: true,emailValid: true},
          'employee[primary_technology]': {required: true},
          'employee[secondary_technology]': {required: true}
        }

			});
      $('.edit_employee').validate({
        rules: {
          'employee[first_name]': {required: true},
          'employee[last_name]': {required: true},
          'employee[username]': {required: true},
          'employee[email]': {required: true,emailValid: true},
          'employee[primary_technology]': {required: true},
          'employee[secondary_technology]': {required: true}
        }

      });
			// code here
		}
	}
}
