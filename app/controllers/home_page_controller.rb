class HomePageController < ApplicationController
  def index
      @content = assemble "subjects"
  end

  
  private
    def assemble(subject_list="404")
      subjects = wiki_raw subject_list
      content_raw = ""
      subjects.each_line do |line|
        unless line.empty?
          content_raw << wiki_raw(line.to_s.chomp )
          content_raw << "\n --- \n"
        end 
      end
        content = mark_render content_raw
    end 
  
  
end
