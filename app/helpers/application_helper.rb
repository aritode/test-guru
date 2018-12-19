module ApplicationHelper

  def flash_message(type, msg)
    content_tag :p, msg, class: "flash #{type}"
  end

  def github_url(user:, repo: '')
    result_body = if repo.blank?
                    user
                  else
                    repo.split(/[-_]/).map(&:capitalize).join
                  end

    link_to result_body,
            "https://github.com/#{user}/#{repo}",
            target: '_blank'
  end

  def current_year
    Date.today.year
  end

  def current_user_name
    if current_user.present?
      "#{current_user.first_name.strip if current_user.first_name.present?}
      #{current_user.last_name.strip if current_user.last_name.present?}"
    end
  end

end
