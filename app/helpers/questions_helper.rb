module QuestionsHelper
  def question_header(question)
    test_title = question.test.title
    action_name = controller.action_name

    name = if action_name == 'edit'
             "Edit #{test_title} Question"
           elsif action_name == 'new'
             "Create New #{test_title} Question"
           else
             "#{action_name.capitalize} #{test_title} Question"
           end

    content_tag('h1', name)
  end
end
