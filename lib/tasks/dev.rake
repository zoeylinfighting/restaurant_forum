namespace :dev do
  
  task fake_restaurant: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample
        )
    end
    puts "Have created fake restaurants"
    puts "Now you have #{Restaurant.count} restaurants data"
  end

  task fake_user: :environment do

    20.times do |i|
      user_name = FFaker::Name.unique.first_name
      User.create!(
        name: user_name,
        email: "#{user_name}@mail.com", 
        password: "12345678"
      )
    end
    puts "Have created fake users"
    puts "Now you have #{User.count} users data"
  end

  task fake_comment: :environment do
    Restaurant.all.each do |restaurant|

      3.times do |i|
        restaurant.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
        )
      end
    end
    puts "Have created fake comments"
    puts "Now you have #{Comment.count} comments data"
  end

end
