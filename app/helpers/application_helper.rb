

module ApplicationHelper
# Return a title on a per-page basis.
require 'digest/md5'

def logo
image_tag("sendal.jpg", :alt => "Sample App", :class => "round")
end

def gravatar_url_for(email, options = {})      
url_for({ :gravatar_id => Digest::MD5.hexdigest(email), :host => 'www.gravatar.com',                
     :protocol => 'http://', :only_path => false, :controller => 'avatar.php'               
      }.merge(options))  end



def title

base_title = " SANDAL the Student Developer Community"
if @title.nil?
base_title
else
"#{base_title} | #{@title}"
end
end
end
