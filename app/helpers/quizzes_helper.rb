module QuizzesHelper
    def id_question_without_response(answers, questions)
        answers_uncompleted = question_without_response_by_user(answers)
        if answers_uncompleted.size > 0
            answers_uncompleted.first.question.id
        else
            ''
        end
    end

    def question_without_response(answers, questions)
        answers_uncompleted = question_without_response_by_user(answers)
        if answers_uncompleted.size > 0
            answers_uncompleted.first.question.text
        else
            "Não existem novas perguntas cadastrada para seu usuário."
        end
    end

    def visibility_style(answer)
        if user_has_question_to_response(answer)
            "visibility:show"
        else
            "visibility:hidden"
        end
    end

    def user_has_question_to_response(answer)
        !answer.where(answer: nil).empty?
    end

    def answers_user(answer)
        answer.where(user_id: current_user.id)
    end

private 

    def question_without_response_by_user(answers)
        answers_user(answers).select{|a| a.answer == nil or a.answer == ''}
    end

end
