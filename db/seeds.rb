# frozen_string_literal: true

# create 5 users
user1 = User.create(name: "John", email: "john@example.com", password: "password")
user2 = User.create(name: "Jane", email: "jane@example.com", password: "password")
user3 = User.create(name: "Bob", email: "bob@example.com", password: "password")
user4 = User.create(name: "Alice", email: "alice@example.com", password: "password")
user5 = User.create(name: "Eve", email: "eve@example.com", password: "password")

# create 2 debit cards for each user
User.all.each do |user|
  2.times do
    DebitCard.create(
      name: Faker::Name.name,
      surname: Faker::Name.last_name,
      card_number: Faker::Number.number(digits: 16),
      expiration_date: Faker::Date.forward(days: 365),
      cvv: Faker::Number.number(digits: 3),
      user: user
    )
  end
end

# create an identity card for a user
User.all.each do |user|
IdentityCard.create(
  name: Faker::Name.first_name,
  surname: Faker::Name.last_name,
  citizenship: Faker::Nation.nationality,
  country_of_birth: Faker::Nation.nationality,
  sex: ['male', 'female'].sample,
  pesel: Faker::Number.number(digits: 11),
  series_and_number: Faker::Number.number(digits: 8),
  expiration_date: Faker::Date.forward(days: 365),
  street: Faker::Address.street_name,
  house_number: Faker::Number.number(digits: 3),
  city: Faker::Address.city,
  zipcode: Faker::Address.zip_code,
  user: user
)
end

# create a fundraiser for each user
User.all.each do |user|
  Fundraiser.create(
    title: Faker::Lorem.sentence,
    discription: Faker::Lorem.paragraph,
    user: user
  )
end

# create a money box for each user in a different fundraiser than their own randomly
User.all.each do |user|
  MoneyBox.create(
    title: Faker::Lorem.sentence,
    notification: Faker::Lorem.paragraph,
    fundraiser: Fundraiser.where.not(user: user).sample,
    user: user
  )
end

# create 2 donations from each user to different fundraisers than their own randomly
User.all.each do |user|
  2.times do
    Donation.create(
      amount: Faker::Number.number(digits: 3),
      note: Faker::Lorem.sentence,
      payment_successed: Faker::Boolean.boolean,
      hidden_name: Faker::Boolean.boolean,
      hidden_amount: Faker::Boolean.boolean,
      fundraiser: Fundraiser.where.not(user: user).sample,
      user: user
    )
  end
end

# create 2 donations from each user to a different money box than their own randomly
User.all.each do |user|
  2.times do
    Donation.create(
      amount: Faker::Number.number(digits: 3),
      note: Faker::Lorem.sentence,
      payment_successed: Faker::Boolean.boolean,
      hidden_name: Faker::Boolean.boolean,
      hidden_amount: Faker::Boolean.boolean,
      money_box: MoneyBox.where.not(user: user).sample,
      user: user
    )
  end
end

# create 2 observed fundraisers for each user that are different than their own randomly
User.all.each do |user|
  2.times do
    ObservedFundraiser.create(
      fundraiser: Fundraiser.where.not(user: user).sample,
      user: user
    )
  end
end

# create 5 photos for each fundraiser randomly
Fundraiser.all.each do |fundraiser|
  5.times do
    Photo.create(
      photo: Faker::Lorem.sentence,
      fundraiser: fundraiser
    )
  end
end

# create 3 updates for each fundraiser randomly
Fundraiser.all.each do |fundraiser|
  3.times do
    FundraiserUpdate.create(
      note: Faker::Lorem.paragraph,
      fundraiser: fundraiser
    )
  end
end

# create 3 invoices for each user
User.all.each do |user|
  3.times do
    Invoice.create(
      title: Faker::Lorem.sentence,
      invoice_link: Faker::Lorem.sentence,
      user: user
    )
  end
end
