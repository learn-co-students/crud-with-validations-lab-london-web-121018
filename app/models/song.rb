class Song < ActiveRecord::Base
    validates :title, presence: true, uniqueness: { scope: :release_year}
    validates :artist_name, presence: true
    validates :released, inclusion: { in: [true, false]}
    validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.today.year}, unless: Proc.new{ |s| s.released == false}
end
