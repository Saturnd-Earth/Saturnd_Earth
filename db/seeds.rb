Like.destroy_all
Post.destroy_all
User.destroy_all

like_user1 = User.create!(username: Faker::Internet.unique.email, password: '12345', password_confirmation: '12345')
like_user2 = User.create!(username: Faker::Internet.unique.email, password: '12345', password_confirmation: '12345')

25.times do |num|
  User.create!(username: Faker::Internet.unique.email, password: '12345', password_confirmation: '12345')
  puts "#{num} users created!"
end

150.times do |num|
  user = User.order('RANDOM()').first
  user.posts.create!(text: Faker::Quote.most_interesting_man_in_the_world, latitude: rand(39.500000..40.050000), longitude: rand(-105.300000..-104.700000), post_type: "Comment")
  puts "#{num} Denver posts created!"
end

150.times do |num|
  user = User.order('RANDOM()').first
  user.posts.create!(text: Faker::Quote.most_interesting_man_in_the_world, latitude: rand(37.000001..40.999999), longitude: rand(-109.000000..-102.000000), post_type: "Comment")
  puts "#{num} Colorado posts created!"
end

150.times do |num|
  user = User.order('RANDOM()').first
  user.posts.create!(text: Faker::Quote.most_interesting_man_in_the_world, latitude: rand(27.000001..47.999999), longitude: rand(-125.000000..-70.000000), post_type: "Comment")
  puts "#{num} United States posts created!"
end

30.times do |num|
  user = User.order('RANDOM()').first
  user.posts.create!(text: Faker::Quote.most_interesting_man_in_the_world, latitude: rand(-25.000000..10.000000), longitude: rand(-77.000000..-43.000000), post_type: "Comment")
  puts "#{num} South American posts created!"
end

15.times do |num|
  user = User.order('RANDOM()').first
  user.posts.create!(text: Faker::Quote.most_interesting_man_in_the_world, latitude: rand(-33.000000..5.000000), longitude: rand(13.000000..39.000000), post_type: "Comment")
  puts "#{num} African posts created!"
end

60.times do |num|
  user = User.order('RANDOM()').first
  user.posts.create!(text: Faker::Quote.most_interesting_man_in_the_world, latitude: rand(7.000000..33.000000), longitude: rand(-7.000000..120.000000), post_type: "Comment")
  puts "#{num} Northern Africa, Middle East, and Southern Asia posts created!"
end

100.times do |num|
  user = User.order('RANDOM()').first
  user.posts.create!(text: Faker::Quote.most_interesting_man_in_the_world, latitude: rand(36.000000..61.000000), longitude: rand(-8.000000..41.000000), post_type: "Comment")
  puts "#{num} European posts created!"
end

50.times do |num|
  user = User.order('RANDOM()').first
  user.posts.create!(text: Faker::Quote.most_interesting_man_in_the_world, latitude: rand(36.000000..61.000000), longitude: rand(41.000000..120.000000), post_type: "Comment")
  puts "#{num} Northern Asia and Russian posts created!"
end

30.times do |num|
  user = User.order('RANDOM()').first
  user.posts.create!(text: Faker::Quote.most_interesting_man_in_the_world, latitude: rand(-34.000000..-20.000000), longitude: rand(115.000000..150.000000), post_type: "Comment")
  puts "#{num} Australian posts created!"
end

3000.times do |num|
  post = Post.order('RANDOM()').first
  post.increase_ring
  puts "#{num} increased rings!"
end

Post.all.each do |post|
  post.likes.create!(user_id: like_user1.id, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  post.likes.create!(user_id: like_user2.id, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  puts "Likes created for post #{post.id}!"
end
