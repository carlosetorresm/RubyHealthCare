class Consult < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :speciality
  has_many_attached :adj

  validates :symptoms, presence: true, length: { minimum: 10}
  validate :adj_type

  def thumbnail input
    return self.adj[input].variant(resize: '500x300!').processed
  end
  private
  def adj_type
    if adj.attached? == false
      errors.add(:adj, "are missing!")
    end
    adj.each do |image|
      if !image.content_type.in?(%('image/jepg image/png video/mp4 video/webm')) 
        errors.add(:adj, "solo se reciben archivos jpeg, png, mp4 o webm")
      end
    end
  end
end
