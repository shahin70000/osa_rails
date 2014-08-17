require 'active_support/concern'

module RegularMessages
  extend ActiveSupport::Concern
  
  def welcome_message
    "Hello, and welcome to the interactive article of Observer Spectrum. \b hello again"
  end

end