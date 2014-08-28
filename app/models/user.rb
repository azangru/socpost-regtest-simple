# encoding: UTF-8
class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :date_of_birth, :email, :first_name, :last_name, :password, :patronymic_name, :username

  validates :username, length: { in: 5..32, :message => "логин должен быть длиной от 5 до 32 символов" }
  validates :username, uniqueness: {:message => 'такой логин уже существует'}
  validates :password, presence: {:message => 'пароль не может быть пустым'}


  HUMANIZED_ATTRIBUTES = {
    :username => "Логин: ",
    :password => "Пароль: "
  }

  def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  def full_name
    "#{last_name} #{first_name} #{patronymic_name}".strip
  end

end
