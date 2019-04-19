module ApplicationHelper

  BOOTSTRAP_ALERTS = { 'notice' => 'alert-success', 'alert' => 'alert-danger' }.freeze
  DEFAULT_BOOTSTRAP_ALERT = 'alert-primary'.freeze

  def flash_message(type, msg)
    alert_type = BOOTSTRAP_ALERTS[type] || DEFAULT_BOOTSTRAP_ALERT
    content_tag :div, sanitize(msg, attributes: %w[href target]),
                class: "alert #{alert_type}"
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

  # Using ApplicationHelper#common_translations
  # and JS (window.I18n) in LayoutsAdmin#header
  def common_translations
    # I18n.backend.send(:init_translations) unless I18n.backend.initialized?
    @translations ||= I18n.backend.send(:translations)
    # Read only 'actions' from commons.[:locale].yml
    @translations[I18n.locale].with_indifferent_access['actions']
  end

end
