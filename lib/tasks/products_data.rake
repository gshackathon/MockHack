namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Product.create!(title: "My Country My Life",
                 imageUrl: "http://www.southasiabooks.com/images/MyCountry.jpg",
                 description: "Written by L.K.Advani",
		 price: 100,
                 stock: 10)
    99.times do |n|
      title = Faker::Name.name
      description = Faker::Lorem.words(10)
      imageurl = "http://www.southasiabooks.com/images/MyCountry.jpg"
      price = n+100
      stock = n+1
      Product.create!(title: title,
                   description: description,
                   imageUrl: imageurl,
                   price: price,
		   stock: stock)
    end
  end
end

