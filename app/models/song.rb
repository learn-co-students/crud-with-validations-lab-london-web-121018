class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :release_year, presence: true, numericality:{less_than: Time.now.year}, if: :released
end
