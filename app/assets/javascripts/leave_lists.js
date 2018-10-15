LeaveLists = {
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
            var startDate = $('#leave_list_start_date').val();
            return Date.parse(startDate) <= Date.parse(value) || value == "";
        }, "* End date must be after start date");
        $('#formId').validate();


      $('.new_leave_list').validate({
        rules: {
          'leave_list[employee_id]': {required: true},
          'leave_list[start_date]': {required: true},
          'leave_list[end_date]': {required: true,endDate: true},
          'leave_list[project_id]': {required: true}
        }

			});
      $('.edit_project').validate({
        rules: {
          'leave_list[employee_id]': {required: true},
          'leave_list[start_date]': {required: true},
          'leave_list[end_date]': {required: true,endDate: true},
          'leave_list[project_id]': {required: true}
        }

      });
		}
	}
}
