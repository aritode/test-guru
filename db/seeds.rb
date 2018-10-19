# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Categories

frontend = Category.create(title: 'Frontend')
backend = Category.create(title: 'Backend')
mobile = Category.create(title: 'Mobile Development')

# Tests

html = frontend.tests.create(title: 'HTML', level: 0)
css = frontend.tests.create(title: 'CSS', level: 1)
ruby = backend.tests.create(title: 'Ruby', level: 2)
go_lang = backend.tests.create(title: 'Go', level: 3)
swift = mobile.tests.create(title: 'Swift', level: 4)

# Questions

questions = Question.create(
  [{ body: 'What is the use of figure tag in HTML 5?', test: html },
   { body: 'What are the entities in HTML?', test: html },
   { body: 'In how many ways you can compare Ruby string?', test: ruby },
   { body: 'What are Ruby arrays and how they can be created?', test: ruby },
   { body: 'Why should one use Go programming language?', test: go_lang },
   { body: 'Why should one use Swift programming language in 2018?', test: swift }]
)

# Answers

Answer.create(
  [{ body: 'Correct answer to HTML', correct: true, question: questions[0] },
   { body: 'Incorrect answer to HTML', correct: false, question: questions[0] },
   { body: 'Correct answer to Ruby', correct: true, question: questions[2] },
   { body: 'Correct answer to Ruby', correct: false, question: questions[2] }]
)

# Users

john = User.create(name: 'John', email: 'john@testmail.org', role: 'user')
daniel = User.create(name: 'Daniel', email: 'daniel007@yahoomail.org', role: 'user')
bill = User.create(name: 'Bill', email: 'BillyBo@gmailtest.org', role: 'admin')

# Results

Result.create(
    [{ user: john, test: html, status: 'Finished' },
     { user: john, test: css, status: 'Not started' },
     { user: daniel, test: ruby, status: 'Not finished' },
     { user: bill, test: go_lang, status: 'Finished' }]
)
