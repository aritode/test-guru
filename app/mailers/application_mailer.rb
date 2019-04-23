class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru Project" <testguru-project@yandex.com>}
  layout 'mailer'
end
