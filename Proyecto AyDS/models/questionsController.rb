module QuestionsController
  def initialize(user, questions)
    @user = user
    @questions = questions
    @correct_answers_count = 0
    @incorrect_answers_count = 0
    @progress_level2 = 0
  end

  def ask_questions
    @questions.each_slice(3) do |slice|
      slice.each do |question|
        # Aquí iría la lógica para mostrar la pregunta y obtener la respuesta del usuario
        respuesta_correcta = obtener_respuesta_del_usuario(question)

        if respuesta_correcta
          @correct_answers_count += 1
        else
          @incorrect_answers_count += 1
        end
      end

      if @correct_answers_count >= 2
        @progress_level2 += 1
        avanzar_leccion
      end

      # Reiniciar contadores para el siguiente slice
      @correct_answers_count = 0
      @incorrect_answers_count = 0
    end
  end

  private

  def obtener_respuesta_del_usuario(question)
    # Lógica para obtener la respuesta del usuario
    # Retorna true si la respuesta es correcta, false en caso contrario
  end

  def avanzar_leccion
    # Lógica para avanzar la lección
    # Esto podría incluir una llamada al servidor o actualización del modelo del usuario
    @user.update(progress_level2: @progress_level2)
    # Aquí podrías hacer una llamada al servidor si es necesario
  end
end