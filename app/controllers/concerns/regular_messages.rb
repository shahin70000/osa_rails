require 'active_support/concern'

module RegularMessages
  extend ActiveSupport::Concern

  def welcome_message
   wiki = Gollum::Wiki.new(".git", :base_path => "/gollum")
   wiki.page('Home').raw_data
  end

end