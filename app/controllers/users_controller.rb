class UsersController < ApplicationController
before_filter :authenticate, :only => [:index, :edit, :update]
before_filter :correct_user, :only => [:edit, :update]
before_filter :admin_user,   :only => :destroy

before_filter :authenticate, :except => [:show, :new, :create]

def index
@title = "All users"
@users = User.paginate( :page => params[:user_page])
end

def following
@title = "Following"
@user = User.find(params[:id])
@users = @user.following
render 'show_follow'
end

def followers
@title = "Followers"
@user = User.find(params[:id])
@users = @user.followers
render 'show_follow'
end

def destroy
User.find(params[:id]).destroy
flash[:success] = "User destroyed"
redirect_to users_path
end

def index
@title = "All users"
@users = User.all
end


def show
  @user = User.find(params[:id])
  @microposts =@user.microposts
  @title = CGI.escapeHTML(@user.name)
end



def new
  @user = User.new
  @title = "Sign up"
end

  
def create
   @user = User.new(params[:user])
   if @user.save
     sign_in @user
     flash[:success] = "selamat datang di aplikasi ini"
     redirect_to @user
   else
    @title = "Sign up"
    render 'new'
 end
end
def edit

@title = "Edit user"
end 

def update

if @user.update_attributes(params[:user])
flash[:success] = "Profile updated."
redirect_to @user
else
@title = "Edit user"
render 'edit'
end
end
            
private
def authenticate
deny_access unless signed_in?
end

def correct_user
@user = User.find(params[:id])
redirect_to(root_path) unless current_user?(@user)
end

def admin_user
redirect_to (root_path) unless current_user.admin?
end

end

