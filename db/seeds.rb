# This file should contain all the record creation
# needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed
# (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

quiz_file = File.read(Rails.root + 'db/questions/quiz.json')
def keys_to_sym hash
  hash.inject({}) do |mem, (key, value)|
    mem[key.to_sym] = value
    mem
  end
end
quiz = JSON.parse(quiz_file)

quiz.each do |section_name, section_data|
  section = Section.create(name: section_name)
  section_data['questions'].each do |question|
    question = keys_to_sym question
    section.questions.create(question)
  end
end
