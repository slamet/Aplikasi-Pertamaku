class CommunityController < ApplicationController
  def index
    @letters ="ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")
        if params[:id]
          @initial = params[:id]
        	users =User.find(:all,
             :conditions => ["name like ?", @initial+'%'],
             :order => "name" )
             
     end
  end

  def browse
  end

  def search
  end

end
