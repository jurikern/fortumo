class Users::ConfirmationsController < Devise::ConfirmationsController
  def new
    include_resend_instructions_title
    super
  end
  
  def create
    include_resend_instructions_title
    super    
  end
  
  private
  
    def include_resend_instructions_title  
      unless @title
        @title = "Resend confirmation instructions"
      end
    end
end