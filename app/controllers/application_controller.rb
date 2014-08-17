class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include RegularMessages
  
  private
  
    def markdown
      renderer = renderer = Redcarpet::Render::HTML.new(no_links: true)
      Redcarpet::Markdown.new(renderer)
    end
  
    def wiki_raw(name="404")
      gollum = Gollum::Wiki.new("gollum/.git")
      page = gollum.page(name)
                  
      if page.nil?
        page = gollum.page('404')
        result = page.raw_data
        result << name
        result << "*)"
      else
        result = page.raw_data
      end
      
      result
    end
    
    def mark_render(raw_object)
      (markdown.render raw_object).html_safe
    end 
  
    def wiki(name)
      page_raw = wiki_raw(name)
      mark_render page_raw
    end
end
