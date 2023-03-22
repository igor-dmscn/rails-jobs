class UserMailer < ApplicationMailer
  default from: 'notificacoes@exemplo.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://exemplo.com/login'
    mail(to: @user.email, subject: 'Boas vindas ao nosso incrível site!')
  end

  def update_password
    @user = params[:user]
    @url  = 'http://exemplo.com/change_password'
    mail(to: @user.email, subject: 'Altere sua senha!')
  end
end
