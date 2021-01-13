Like.destroy_all
Post.destroy_all
User.destroy_all

like_user1 = User.create!(username: Faker::Internet.unique.email, password: '12345', password_confirmation: '12345')
like_user2 = User.create!(username: Faker::Internet.unique.email, password: '12345', password_confirmation: '12345')

25.times do |num|
  User.create!(username: Faker::Internet.unique.email, password: '12345', password_confirmation: '12345')
  puts "#{num} users created!"
end

200.times do |num|
  user = User.order('RANDOM()').first
  user.posts.create!(text: Faker::Quote.most_interesting_man_in_the_world, latitude: rand(39.500000..40.050000), longitude: rand(-105.300000..-104.700000), post_type: "Comment")
  puts "#{num} Denver posts created!"
end

200.times do |num|
  user = User.order('RANDOM()').first
  user.posts.create!(text: Faker::Quote.most_interesting_man_in_the_world, latitude: rand(37.000001..40.999999), longitude: rand(-109.000000..-102.000000), post_type: "Comment")
  puts "#{num} Colorado posts created!"
end

200.times do |num|
  user = User.order('RANDOM()').first
  user.posts.create!(text: Faker::Quote.most_interesting_man_in_the_world, latitude: rand(27.000001..47.999999), longitude: rand(-125.000000..-70.000000), post_type: "Comment")
  puts "#{num} United States posts created!"
end

600.times do |num|
  user = User.order('RANDOM()').first
  user.posts.create!(text: Faker::Quote.most_interesting_man_in_the_world, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude, post_type: "Comment")
  puts "#{num} random posts created!"
end

5000.times do |num|
  post = Post.order('RANDOM()').first
  post.increase_ring
  puts "#{num} increased rings!"
end

Post.all.each do |post|
  post.likes.create!(user_id: like_user1.id, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  post.likes.create!(user_id: like_user2.id, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  puts "Likes created for post #{post.id}!"
end
