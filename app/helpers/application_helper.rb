require 'redcarpet'
require 'redcarpet/render_strip'

module ApplicationHelper
  def tropo_intro
    "<br>"\
    "<p>**Tropo** connects users to applications using "\
    "both _voice_ and _messaging_.</p>"\
    "<br>"\
    "<p>This **application** uses call and sms for testing.</p>"
  end

  def markdown(params={}, message)
    # renderer = Redcarpet::Render::HTML.new(render_options = params)
    # markdown = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    # markdown.render("**This** _is_ an [example](http://example.org/).")
    renderer = Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    markdown.render(message).html_safe
  end
end
