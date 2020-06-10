class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,:confirmable
  validates :email, uniqueness: true
  validates :username, presence: true, uniqueness: true
  has_one_attached :avatar
  has_many :prescription
  has_many :sell

  after_create :insertarcovid

  def insertarcovid
    @CovidCondition = CovidCondition.new
    @CovidCondition.patient = self
    @CovidCondition.condition = Condition.find(1)
    @CovidCondition.save
  end
end
