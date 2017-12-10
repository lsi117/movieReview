class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :movies
  # Added dependent destroy because when a user deletes their acct their reviews also get destroyed
  has_many :reviews, dependent: :destroy
end
