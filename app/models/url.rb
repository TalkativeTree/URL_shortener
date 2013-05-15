class Url < ActiveRecord::Base

  validates :long_url, :format => { :with =>  /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/, :message => "Invalid URL: urls need to start with https:// or http://"  } 
  
  # Remember to create a migration!
  before_create :shorten_url #important, because if you do before save and call an update, it will rerun before_save).

  def shorten_url
    self.short_url = SecureRandom.hex(2)
  end
  
  # def check_url
  #   :long_url.match(/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/)
end
