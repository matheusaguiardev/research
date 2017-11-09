class QuizMailer < ApplicationMailer
    default from: "quiz@aguiar.com"

    def body_mailer(user, result)
        @user = user
        @result = result
        mail(to: @user.email, subject: 'Resultado da pesquisa')
    end

end
