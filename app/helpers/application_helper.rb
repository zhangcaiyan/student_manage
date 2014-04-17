module ApplicationHelper
  def link_to_icon(icon_string, caption, url_or_object, options={})
    link_to(url_or_object, options) do
      html = <<-HTML
      <i class="#{icon_string}"></i> #{caption}
      HTML
      html.html_safe
    end
  end
end
