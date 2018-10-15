Projects = {
	form: {
		formValidation: function() {
				// $.validator.addMethod('emailValid', function(value, element){
    //     return this.optional(element) || /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$/i.test(value);
    //     }, 'Please enter a valid email address.');

    //   $.validator.addMethod('passwordValid', function(value, element){
    //     return this.optional(element) || /^(?=.*\d).{8,}$/.test(value);
    //     }, 'Password must have eight characters, and at least one numberal.');

    //   $.validator.addMethod('phonenoValid', function(value, element){
    //     return this.optional(element) || /^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$/.test(value);
    //     }, 'Please enter a valid Phone number.');
      $.validator.addMethod("endDate", function(value, element) {
            var startDate = $('#project_start_date').val();
            return Date.parse(startDate) <= Date.parse(value) || value == "";
        }, "* End date must be after start date");

      $.validator.addMethod('costValid', function(value, element){
        return this.optional(element) || /^[0-9?=.*!@#$%^&*]+$/.test(value);
        }, 'Please enter a valid Budget.');

      $('.new_project').validate({
        rules: {
          'project[project_name]': {required: true},
          'project[start_date]': {required: true},
          'project[end_date]': {required: true,endDate: true},
          'project[employee_id]': {required: true},
          'project[client_id]': {required: true},
          // 'project[budget]':{required: true, costValid: true},
          'project[technology_ids][]': {required: true}
        }

			});
      $('.edit_project').validate({
        rules: {
          'project[project_name]': {required: true},
          'project[start_date]': {required: true},
          'project[end_date]': {required: true},
          'project[employee_id]': {required: true},
          'project[client_id]': {required: true},
          'project[technology_ids][]': {required: true}
        }

      });
		}
	}
}
