class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year}
  validates :title, uniqueness: {scope: :artist_name }
  validates :release_year, presence: true, numericality:{less_than: Time.now.year}, if: :released
end
