class HomePageController < ApplicationController
  def wiki
      @content = assemble "subjects"
  end

  def index
  end

  def minia
  end

  private
    def assemble(subject_list="404")
      subjects = wiki_raw subject_list
      content_raw = ""
      subjects.each_line do |line|
        unless line.empty? or line == "\n"
          content_raw << "# #{line}"
          content_raw << "\n"
          content_raw << wiki_raw(line.to_s.chomp)
          content_raw << "\n"
        end 
      end
        content = mark_render content_raw
    end 
  
  
end
