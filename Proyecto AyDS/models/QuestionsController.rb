class QuestionsController < Sinatra::Base
  post '/questions' do
    user = User.find(session[:user_id])
    level = params[:level]
    questions = Question.where(level: level)

    ask_questions(user, questions, level)

    redirect '/next_page' # Adjust the redirection as needed
  end

  def ask_questions(user, questions, level)
    correct_answers_count = 0
    progress_field = "progress_level#{level}"
    progress = user.send(progress_field)

    questions.each_slice(3) do |slice|
      stack = []
      slice.each { |question| stack.push(question) }

      until stack.empty?
        question = stack.pop
        respuesta_correcta = obtener_respuesta_del_usuario(question)
        correct_answers_count += 1 if respuesta_correcta
      end

      if correct_answers_count >= 2
        progress += 1
        avanzar_leccion(user, progress, progress_field)
      end

      correct_answers_count = 0
    end
  end

  private

  def obtener_respuesta_del_usuario(question)
    # Logic to get the user's answer
    # Return true if the answer is correct, false otherwise
  end

  def avanzar_leccion(user, progress, progress_field)
    user.update(progress_field => progress)
  end
end