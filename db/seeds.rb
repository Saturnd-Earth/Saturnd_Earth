User.destroy_all

like_user = User.create!(username: Faker::Internet.unique.email, password: '12345', password_confirmation: '12345')

3.times do
  User.create!(username: Faker::Internet.unique.email, password: '12345', password_confirmation: '12345')
end

User.all.each do |user|
  user.posts.create!(content: Faker::Quote.unique.most_interesting_man_in_the_world, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
end

Post.all.each do |post|
  2.times do
    post.likes.create!(user_id: like_user.id, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  end
end
