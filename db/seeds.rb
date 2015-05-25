require 'faker'
5.times do
  user = User.create(name: Faker::Name.first_name, password: 'password', password_confirmation: 'password')
  5.times do
    user.questions << Question.create(title: Faker::Hacker.adjective, body: Faker::Hacker.say_something_smart)
  end
end

User.all.each do |user|
  Question.all.each do |question|
    question.answers.create(body: Faker::Lorem.sentence, user_id: user.id)
    question.responses.create(body: Faker::Hacker.ingverb, user_id: user.id)
    question.tags.create(name: Faker::Hacker.noun)
  end
  Answer.all.each do |answer|
    answer.responses.create(body: Faker::Hacker.ingverb, user_id: user.id)
    answer.votes.create(value: 1, voter_id: user.id)
  end
end




