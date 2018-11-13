module ApplicationHelper
  def github_url(author, repo = '')
    result_body = repo.split(/[-_]/).map(&:capitalize).join

    link_to result_body,
            "https://github.com/#{author}/#{repo}",
            target: '_blank'
  end

  def current_year
    Date.today.year
  end
end
