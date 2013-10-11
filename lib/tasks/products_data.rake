namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Product.create!(Title: "My Country My Life",
                 ImageUrl: "http://www.southasiabooks.com/images/MyCountry.jpg",
                 Description: "Written by L.K.Advani",
		 Price: 100,
                 Stock: 10)
    99.times do |n|
      title = Faker::Name.name
      description = Faker::Lorem.words(10)
      imageurl = "http://www.southasiabooks.com/images/MyCountry.jpg"
      price = n+100
      stock = n+1
      Product.create!(Title: title,
                   Description: description,
                   ImageUrl: imageurl,
                   Price: price,
		   Stock: stock)
    end
  end
end

