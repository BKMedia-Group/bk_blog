class RedcarpetWithExternalLinks < Redcarpet::Render::HTML
  def link(link, title, content)
    if content[0] == '_'
      "<a href='#{link}' title='#{title}' target='_blank'>#{content[1..-1]}</a>"
    else
      "<a href='#{link}' title='#{title}'>#{content}</a>"
    end
  end
end
class String
  def to_html


    markdown = Redcarpet::Markdown.new(RedcarpetWithExternalLinks, :autolink => true, :space_after_headers => true, :tables => true)
    markdown.render(self).html_safe
  end
end
