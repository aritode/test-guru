document.addEventListener('turbolinks:load', () => {
    const progress = document.querySelector('.progress')
    const progressBar = document.querySelector('.progress-bar')

    if (progress && progressBar) {
        progressBar.style.width = progress.dataset.percent + '%'
    }
})
