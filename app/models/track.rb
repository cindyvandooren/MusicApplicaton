# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  title      :string           not null
#  status     :string           not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  STATUS = %w(bonus regular)

  validates :album, presence: true
  validates :title, :status, presence: true
  validates :status, inclusion: STATUS

  belongs_to(
    :album,
    class_name: :Album,
    foreign_key: :album_id,
    primary_key: :id
  )

  has_one :band, through: :album, source: :band
end
