document.addEventListener('turbolinks:load', () => {
    const password = document.getElementById('user_password')
    const passwordConfirmation = document.getElementById('user_password_confirmation')

    const correctIcon = document.querySelector('.octicon.text-success')
    const wrongIcon = document.querySelector('.octicon.text-danger')

    const passwordCheck = () => {
        if (passwordConfirmation.value === '') {
            correctIcon.classList.add('hide')
            wrongIcon.classList.add('hide')
        } else if (passwordConfirmation.value === password.value) {
            correctIcon.classList.remove('hide')
            wrongIcon.classList.add('hide')
        } else {
            correctIcon.classList.add('hide')
            wrongIcon.classList.remove('hide')
        }
    }

    passwordConfirmation.addEventListener('input', () => passwordCheck())
    password.addEventListener('input', () => passwordCheck())
})



