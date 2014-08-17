class HomePageController < ApplicationController
  def index
    @content = wiki_page "home"
  end
  
  private
  
    def wiki_page(name="404")
      wiki = Gollum::Wiki.new("gollum/.git")
      page = wiki.page(name)
                  
      if page.nil?
        page = wiki.page('404')
      end
      
      page.formatted_data.html_safe
    end
  
    def wiki_file(name="404")
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

      wiki = Gollum::Wiki.new("gollum/.git")
      file = wiki.file(name.to_s+'.md')
      
      if file.nil?
        file = wiki.file('404.md')
      end
      
      (markdown.render file.raw_data).html_safe
    end
  
end
