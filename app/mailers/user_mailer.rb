class UserMailer < ApplicationMailer
    default template_path: 'user_mailer'

    def approve_account(user)
        email = user.email
        token = user.confirmation_token
        mail(
            from: "support@project.com",
            to: email, 
            subject: "Approved account",
        )
    end
end
