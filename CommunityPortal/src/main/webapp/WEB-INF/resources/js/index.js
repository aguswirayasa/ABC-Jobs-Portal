(() => {
	  'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  const forms = document.querySelectorAll('.needs-validation')

	  // Loop over them and prevent submission
	  Array.from(forms).forEach(form => {
	    form.addEventListener('submit', event => {
	      if (!form.checkValidity()) {
	        event.preventDefault()
	        event.stopPropagation()
	      }

	      form.classList.add('was-validated')
	    }, false)
	  })
	})()
	

	

  // get all the input fields on the page
  const inputs = document.querySelectorAll('input');

  // add an event listener to each input field
  inputs.forEach(input => {
    input.addEventListener('keydown', (event) => {
      // if the user pressed Enter
      if (event.keyCode === 13) {
        // get the index of this input field in the array of all inputs
        const currentIndex = Array.from(inputs).indexOf(input);

        // if this is not the last input field, focus on the next input field
        if (currentIndex < inputs.length - 1) {
          inputs[currentIndex + 1].focus();
        }
      }
    });
  });
  
  

  
  
  
  
