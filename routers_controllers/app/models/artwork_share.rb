# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
  validates :viewer_id, presence: true, uniqueness: {scope: :artwork_id, 
  message: "Should only have viewed an artwork once"}
  # validates :artwork_id,  presence: true, uniqueness: {scope: :viewer_id,
  # message: "Should only have one instance of a viewer"}

  belongs_to :viewer,
  foreign_key: :viewer_id,
  dependent: :destroy,
  class_name: :User

  belongs_to :artwork,
  foreign_key: :artwork_id,
  class_name: :Artwork

end
