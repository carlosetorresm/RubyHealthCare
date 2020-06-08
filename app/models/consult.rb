class Consult < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :speciality
  has_many_attached :adj
  has_many :answer

  validates :symptoms, presence: true, length: { minimum: 10}
  validate :adj_type

  scope :respondida, -> { where(:answered => 1)}
  # Ex:- scope :active, -> {where(:active => true)}
  scope :norespondida, -> { where(:answered => 0)}
  # Ex:- scope :active, -> {where(:active => true)}
  scope :cerrada, -> { where(:closed => 1)}
  # Ex:- scope :active, -> {where(:active => true)}
  scope :abierta, -> { where(:closed => 0)}
  # Ex:- scope :active, -> {where(:active => true)}
  scope :ultimos, -> { order("updated_at DESC")}
  # Ex:- scope :active, -> {where(:active => true)}

  def thumbnail input
    return self.adj[input].variant(resize: '500x300!').processed
  end
  private
  def adj_type
    if adj.attached? == false
      errors.add(:adj, "are missing!")
    end
    adj.each do |image|
      if !image.content_type.in?(%('image/jpg image/jpeg image/png video/mp4 video/webm')) 
        errors.add(:adj, "solo se reciben archivos jpg, jpeg, png, mp4 o webm")
      end
    end
  end
end
