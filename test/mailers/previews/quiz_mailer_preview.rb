# Preview all emails at http://localhost:3000/rails/mailers/quiz_mailer
class QuizMailerPreview < ActionMailer::Preview
    def sample_mail_preview
        QuizMailer.body_mailer(User.where(email: 'joaomatheusaguiar@gmail.com').first)
    end
end
