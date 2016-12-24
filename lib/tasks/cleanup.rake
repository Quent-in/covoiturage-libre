namespace :cleanup do
  desc "TODO"
  task encoding: :environment do
    Trip.all.each do |trip|
      trip.name = trip.name.encode("iso-8859-1").force_encoding("utf-8")
      trip.description = trip.name.encode("iso-8859-1").force_encoding("utf-8")
      trip.points.each do |point|
        point.city = point.city.encode("iso-8859-1").force_encoding("utf-8")
        point.save!
      end
      trip.save!
    end
  end

end
