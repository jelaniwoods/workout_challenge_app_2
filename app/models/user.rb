class User < ApplicationRecord
  # Direct associations

  has_many   :photos,
             :class_name => "Photoworkout",
             :dependent => :destroy

  has_many   :participations,
             :dependent => :destroy

  has_many   :privileges,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
