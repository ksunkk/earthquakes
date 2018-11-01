class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]
  
  devise :omniauthable, omniauth_providers: %i[facebook]
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(login) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:login) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def phone_verified!
    update_attributes(phone_confirmed: true)
  end

  def full_name
    [last_name, first_name, surname].join(' ')
  end
end
