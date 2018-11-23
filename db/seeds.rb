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

# Users

john = User.create(name: 'John', email: 'john@testmail.org', role: 'user')
daniel = User.create(name: 'Daniel', email: 'daniel007@yahoomail.org', role: 'user')
bill = User.create(name: 'Bill', email: 'BillyBo@gmailtest.org', role: 'admin')

# Tests

html = frontend.tests.create(title: 'HTML', level: 0, author: john)
css = frontend.tests.create(title: 'CSS', level: 1, author: john)
ruby = backend.tests.create(title: 'Ruby', level: 2, author: bill)
go_lang = backend.tests.create(title: 'Go', level: 3, author: bill)
swift = mobile.tests.create(title: 'Swift', level: 4, author: daniel)

# Questions

questions = Question.create(
  [{ body: 'What is the use of figure tag in HTML 5?', test: html },
   { body: 'What are the entities in HTML?', test: html },
   { body: 'Who created the Ruby Language?', test: ruby },
   { body: 'What is the default value of the instance variable?', test: ruby },
   { body: 'Why should one use Go programming language?', test: go_lang },
   { body: 'Why should one use Swift programming language in 2018?', test: swift }]
)

# Answers

Answer.create(
  [{ body: 'Correct answer to HTML', correct: true, question: questions[0] },
   { body: 'Incorrect answer to HTML', correct: false, question: questions[0] },
   { body: 'Matz', correct: true, question: questions[2] },
   { body: 'John Doe', correct: false, question: questions[2] },
   { body: 'Linus Torvalds', correct: false, question: questions[2] },
   { body: 'Stefan Wintermeyer', correct: false, question: questions[2] },
   { body: 'Nil', correct: true, question: questions[3] },
   { body: 'false', correct: false, question: questions[3] }]
)

# Results

TestPassage.create(
    [{ user: john, test: html, status: 'Finished' },
     { user: john, test: css, status: 'Not started' },
     { user: daniel, test: ruby, status: 'Not finished' },
     { user: bill, test: go_lang, status: 'Finished' }]
)
