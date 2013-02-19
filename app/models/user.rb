class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body


  ###
  ROLES = %w[client admin]
  attr_accessible :name, :role
  has_many :websites

  def role?(base_role)
    return false unless role # A user have a role attribute. If not set, the user does not have any roles.
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
end
