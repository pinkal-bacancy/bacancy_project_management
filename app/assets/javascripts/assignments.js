Assignments = {
	form: {
		formValidation: function() {

      $('.new_assignment').validate({
        rules: {
          'assignment[start_date]': {required: true},
          'assignment[end_date]': {required: true},
          'assignment[employee_ids]': {required: true},
          'assignment[project_id]': {required: true}
        }
      });

      $('.edit_assignment').validate({
        rules: {
          'assignment[start_date]': {required: true},
          'assignment[end_date]': {required: true},
          'assignment[employee_ids]': {required: true},
          'assignment[project_id]': {required: true}
        }
      });
		}
	}
}
