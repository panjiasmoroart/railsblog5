module ApplicationHelper

  #https://www.codefellows.org/blog/how-to-create-a-markdown-friendly-blog-in-a-rails-app/
  #class CodeRayify < Redcarpet::Render::HTML
  #  def block_code(code, language)
  #    CodeRay.scan(code, language).div
  #  end
  #end

  #def markdown(text)
  #  coderayified = CodeRayify.new(:filter_html => true, 
  #                                :hard_wrap => true)
  #  options = {
  #    :fenced_code_blocks => true,
  #    :no_intra_emphasis => true,
  #    :autolink => true,
  #    :lax_html_blocks => true,
  #  }
  #  markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
  #  markdown_to_html.render(text).html_safe
  #end

  #def coderay(text)
  #  text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
  #    CodeRay.scan($1, $2).div(:css => :class)
  #  end
  #end

end
