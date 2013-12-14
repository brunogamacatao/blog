class CursoMailer < ActionMailer::Base
  default from: "admin@brunocatao.com"
  
  def mensagem(matricula, mensagem)
    @matricula = matricula
    @mensagem  = mensagem
    mail to: matricula.user.email
  end
end
