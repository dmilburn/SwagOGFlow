require 'faker'
5.times do
  user = User.create(name: Faker::Name.first_name, password: '123', password_confirmation: '123')
  5.times do
    user.questions.create(title: Faker::Hacker.adjective, body: Faker::Hacker.say_something_smart)
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




