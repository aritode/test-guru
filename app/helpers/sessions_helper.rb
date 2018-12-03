module SessionsHelper

  def flash_message(type)
    content_tag :p, flash.now[type], class: "flash #{type}"
  end

end
