module ApplicationHelper
  def flash_background_color(type)
    case type.to_sym
    when :notice then "bg-green-500"
    when :alert  then "bg-red-500"
    when :error  then "bg-yellow-500"
    else "bg-gray-500"
    end
  end

  def address_processing(address)
    address = address
    address.gsub(/日本、/, '')
  end

  def auto_link_urls(text)
    sanitized_text = sanitize(text)
    sanitized_text.gsub(%r{(https?://[^\s<]+)}) do |url|
      "<a href='#{url}' class='text-accent-blue hover:opacity-50' target='_blank' rel='noopener noreferrer'>#{url}</a>"
    end.html_safe
  end
end
