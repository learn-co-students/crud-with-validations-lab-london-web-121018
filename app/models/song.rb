class MyValidator < ActiveModel::EachValidator
  def validate_each(song, attribute, value)

    unless !Song.all.select{|s| s.title == song.title}.any?{|x| x.artist_name == song.artist_name && x.release_year == song.release_year}
      song.errors[:title] << "This artist already has this song in the same year"
    end unless song.title == nil
  end
end

class YourValidator < ActiveModel::EachValidator
  def validate_each(song, attribute, value)
    if song.released == false
      true
    else
      if song.release_year == nil
        song.errors[:title] << "This song needs a release year!"
      else
        if song.release_year > Time.now.year
          song.errors[:title] << "This release year is in the future!"
        end
      end
    end
  end
end


class Song < ActiveRecord::Base
  validates :title, presence: true, my: true
  validates :released, inclusion: {in: [true,false]}
  validates :release_year, your: true
end
