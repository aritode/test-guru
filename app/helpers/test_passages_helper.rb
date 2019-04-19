module TestPassagesHelper

  def success_percentage_result_message(test_passage)
    if test_passage.test_passed?
      result_status = 'success'
      message = t('test_passages_helper.result.success')
    else
      result_status = 'fail'
      message = t('test_passages_helper.result.fail')
    end

    result_body = [div_percentage_helper(test_passage.success_percentage, result_status),
                   content_tag(:p, message)]

    result_body.join.html_safe
  end

  # result_status == ['success', 'fail']
  def div_percentage_helper(number, result_status)
    content_tag(:div, class: "percentage #{result_status}") do
      number_to_percentage(number, precision: 0)
    end
  end

  def header_current_question(test_passage)
    content_tag(:p) do
      "#{t('test_passages_helper.current_question')}: #{test_passage.current_question_number} /
        #{test_passage.total_questions}"
    end
  end

  def header_current_progress(test_passage)
    test_passage.current_question_index / test_passage.total_questions.to_f * 100
  end

end
