module QuestionsHelper
  def question_header(question)
    test_title = question.test.title

    name = if question.new_record?
             t('questions_helper.create.header', test_title: test_title)
           else
             t('questions_helper.edit.header', test_title: test_title)
           end

    content_tag('h1', name)
  end
end
