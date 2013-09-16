class MatriculasController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @matricula        = Matricula.new(params[:matricula])
    @matricula.user   = current_user
    @matricula.estado = :reservada
    @matricula.save!

    payment = PagSeguro::Payment.new('brunogamacatao@gmail.com', '8AE446E9204345D4B571A0C7CFFA9CC1', id: @matricula.id)
    payment.items = [
      PagSeguro::Item.new(id: @matricula.curso.id, 
                          description: @matricula.curso.nome, 
                          amount: @matricula.curso.preco,  
                          quantity: "1")
    ]
    
    payment.sender   = PagSeguro::Sender.new(name: facebook.name, email: current_user.email)
    payment.shipping = PagSeguro::Shipping.new(type: PagSeguro::Shipping::UNIDENTIFIED)
    
    redirect_to payment.checkout_payment_url
  end
end
