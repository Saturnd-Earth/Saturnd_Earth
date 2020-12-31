Like.destroy_all
Post.destroy_all
User.destroy_all

like_user1 = User.create!(username: Faker::Internet.unique.email, password: '12345', password_confirmation: '12345')
like_user2 = User.create!(username: Faker::Internet.unique.email, password: '12345', password_confirmation: '12345')

3.times do
  User.create!(username: Faker::Internet.unique.email, password: '12345', password_confirmation: '12345')
end

User.all.each do |user|
  user.posts.create!(content: Faker::Quote.unique.most_interesting_man_in_the_world, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
end

Post.all.each do |post|
  post.likes.create!(user_id: like_user1.id, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  post.likes.create!(user_id: like_user2.id, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
end
