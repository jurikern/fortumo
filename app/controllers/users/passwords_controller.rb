class Users::PasswordsController < Devise::PasswordsController
  def new
    include_reset_password_title
    super
  end
  
  def create
    include_reset_password_title
    super
  end
  
  def edit
    include_new_password_title
    super
  end
  
  def update
    include_new_password_title
    super
  end
  
  private
  
    def include_reset_password_title
      unless @title
        @title = "Forgot Your password? - Reset password"
      end
    end
    
    def include_new_password_title
      unless @title
        @title = "Change Your password"
      end
    end
end