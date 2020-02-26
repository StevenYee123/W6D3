# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  artist_id  :integer          not null
#  title      :string           not null
#  image_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord 
  validates :title, presence: true, uniqueness: true
  validates :artist_id, presence: true, uniqueness: { scope: :title,
  message: "Should only have one of each artwork" }

  belongs_to :artist,
  foreign_key: :artist_id,
  class_name: :User

  has_many :shared_artworks,
  foreign_key: :artist_id,
  class_name: :ArtworkShare

  has_many :viewers,
  through: :shared_artworks,
  source: :viewer
  
end
