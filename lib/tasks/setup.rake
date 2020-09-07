# frozen_string_literal: true

desc 'Initial setup the application'
namespace :app do
  task :setup do
    puts '🏁 Start initial setup'

    questions_file = File.open '/qc_search/data/questions.json'
    questions = JSON.load(questions_file)

    puts '🍺 Import questions...'
    questions.each do |question|
      Question.create(
        statement: question['statement'],
        text: question['text'],
        answer: question['answer'],
        daily_access: question['daily_access'],
        discipline: question['discipline'],
        created_at: question['created_at'],
        updated_at: question['created_at']
      )
    end
    questions_file.close

    puts "Total of imported questions: #{Question.count}."
    puts '🚀 Indexing Questions...'
    Question.reindex(resume: true)
    puts '✨Done'

    questions_access_file = File.open '/qc_search/data/question_access.json'
    questions_access = JSON.load(questions_access_file)

    puts '🍺 Import question_access...'
    QuestionsAccess.insert_all(questions_access)
    questions_access_file.close

    puts "Total of imported questions_access: #{QuestionsAccess.count}."

    puts '🚀 Indexing QuestionsAccesses...'
    QuestionsAccess.reindex(resume: true)
    puts '✨Done'
  end
end
