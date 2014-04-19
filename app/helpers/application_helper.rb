module ApplicationHelper
  def link_to_icon(icon_string, caption, url_or_object, options={})
    link_to(url_or_object, options) do
      html = <<-HTML
      <i class="#{icon_string}"></i> #{caption}
      HTML
      html.html_safe
    end
  end

  def title(title)
    content_for :title do
      title + " - "
    end
  end

  def js(*js)
    content_for :script do
      javascript_include_tag *js
    end
  end

  def css(*css)
    content_for :head do
      stylesheet_link_tag *css
    end
  end

end
