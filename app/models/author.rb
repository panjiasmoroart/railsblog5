# == Schema Information
#
# Table name: authors
#
#  id                     :bigint(8)        not null, primary key
#  name                   :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  validates_presence_of :name, on: :update 

  def change_password_update(attrs)
    update(password: attrs[:new_password], password_confirmation: attrs[:new_password_confirmation])
  end

  def gravatar_image_url
    "https://www.gravatar.com/avatar/#{gravatar_hash}" 
  end

  def display_name
    # jika nama ada 
    if name.present?
      name 
    else
      "Author"
    end
  end

  private 

  def gravatar_hash
     Digest::MD5.hexdigest(email.downcase)
  end

end
