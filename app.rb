require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @text = TextAnalyzer.new(params[:user_text])
    @words = @text.count_of_words
    @vowels = @text.count_of_vowels
    @consonants = @text.count_of_consonants
    @pop_letter = @text.most_used_letter
    erb :results
  end
end
