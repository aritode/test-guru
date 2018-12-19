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

end
