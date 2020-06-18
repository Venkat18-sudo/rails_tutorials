User.create!(name: "Example User",
			email: "example@example.com",
			password: "something",
			password_confirmation: "something",
			admin: true )

5.times do |n|
	name = Faker::Name.name
	email = "email-#{n}@example.com"
	password = "password"
	User.create!(name: name,
		email: email,
		password: password,
		password_confirmation: password)
end

users = User.all
50.times do
	content = Faker::Lorem.sentence(word_count: 5)
	users.each { |user| user.microposts.create!(content:content)}
end
