module QuestionsHelper
  def question_header(question)
    test_title = question.test.title

    name = if question.new_record?
             "Create New #{test_title} Question"
           else
             "Edit #{test_title} Question"
           end

    content_tag('h1', name)
  end
end
