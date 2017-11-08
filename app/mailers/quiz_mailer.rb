class QuizMailer < ApplicationMailer
    default from: "quiz@aguiar.com"

    def body_mailer(user)
        @user = user
        puts("Email enviado para: #{@user.email}")
        mail(to: @user.email, subject: 'Resultado da pesquisa')
    end

end
