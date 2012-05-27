class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable,
         :confirmable, :lockable

  has_many :services, :dependent => :destroy
  has_many :images,   :dependent => :destroy

  attr_accessor   :current_password
  attr_accessible :username, :email, :password, :password_confirmation
  
  validates :username, :presence => true, :format => { :with => /\A[A-z\-\s]+\z/ }
  
  def update_with_password(params = {})
    current_password = params.delete(:current_password)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    
    result = if has_no_password? || valid_password?(current_password)
      self.update_attributes(params)
    else
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      self.attributes = params
      false
    end

    result
  end 
  
  private
  
    def has_no_password?
      self.encrypted_password.blank?
    end   
end
