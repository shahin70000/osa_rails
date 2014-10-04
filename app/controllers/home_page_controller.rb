class HomePageController < ApplicationController
  def wiki
      @content = assemble "subjects"
  end

  def index
  end

  def minia

    @search = {}
    @search[:title] = "Iran"
    search = Google::Search::News.new :query => @search[:title]
    
#     @search[:result] = Net::HTTP.get_response(URI.parse(search.get_uri)).body

      @search[:results] = {}
    @json = JSON.parse(open(URI.parse(search.get_uri)).read)

    @json["responseData"]["results"].each_with_index do |result, i|
      @search[:results][i] = {}
      @search[:results][i][:title] = result["title"].to_s
      @search[:results][i][:content] = result["content"].to_s
      @search[:results][i][:link] = result["signedRedirectUrl"].to_s
    end
  
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
  
    def find_item uri, query
    search = Google::Search::Web.new do |search|
      search.query = query
      search.size = :large
      search.each_response { print '.'; $stdout.flush }
    end
    search.find { |item| item.uri =~ uri }
  end

  def rank_for query
    print "%35s " % query
    if item = find_item(/vision\-media\.ca/, query)
      puts " #%d" % (item.index + 1)
    else
      puts " Not found"
    end
  end
end
