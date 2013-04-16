class String
  def to_html
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true, :tables => true)
    markdown.render(self).html_safe
  end
end
