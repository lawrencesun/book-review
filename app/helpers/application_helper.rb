module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def display_date(dt)
    dt.strftime("%d/%m/%Y") 
  end

  def markdown(text)
    renderOptions = {hard_wrap: true, filter_html: true}
    markdownOptions = {autolink: true, fenced_code_blocks: true, no_intra_emphasis: true, strikethrough: true}
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(renderOptions), markdownOptions)
    markdown.render(text).html_safe
  end

end