require 'digest/md5'

class Gravatar

  DefaultOptions = {:size => 80} # px
  
  attr_accessor :id, :size, :rating, :border, :default, :url
  
  def initialize(email = '', options = {})
    options = DefaultOptions.merge(options)
    
    @id = Digest::MD5.hexdigest(email)
    
    @url = 'http://gravatar.com/avatar.php?gravatar_id=' + @id
    options.each {|k,v| @url += "&#{k}=#{v}" unless v.nil?}
    
    %w(size rating border default).each do |a|
      instance_variable_set "@#{a}", options[a.to_sym]
    end    
  end
  
  def to_s; url; end
end

def gravatar(email, options={})
      src = h(gravatar_url(email, options))
      options = DEFAULT_OPTIONS.merge(options)
      [:class, :alt, :size].each { |opt| options[opt] = h(options[opt]) }
      "<img class=\"#{options[:class]}\" alt=\"#{options[:alt]}\" width=\"#{options[:size]}\" height=\"#{options[:size]}\" src=\"#{src}\" />"      
    end
    
def gravatar_for(user, options={})
       gravatar(user.email, options)
      
   end


class Class
  def gravatar(attr_name, o = {})
    define_method :gravatar do
      Gravatar.new(__send__(attr_name), Gravatar::DefaultOptions.update(o))
    end
    end
def gravatar_url(email, options={})
       email_hash = Digest::MD5.hexdigest(email)
       options = DEFAULT_OPTIONS.merge(options)
       options[:default] = CGI::escape(options[:default]) unless options[:default].nil?
       returning "http://www.gravatar.com/avatar.php?gravatar_id=#{email_hash}" do |url| 
         [:rating, :size, :default].each do |opt|
           unless options[opt].nil?
            value = h(options[opt])
             url << "&#{opt}=#{value}" 
end
end    
    
  end
end