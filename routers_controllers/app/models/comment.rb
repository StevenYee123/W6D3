# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  author_id  :integer          not null
#  artwork_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :string           not null
#
class Comment < ApplicationRecord
  belongs_to :author,
  foreign_key: :author_id,
  dependent: :destroy,
  class_name: :User 

  belongs_to :artwork,
  foreign_key: :artwork_id,
  dependent: :destroy,
  class_name: :Artwork
end
