module ApplicationHelper
  def em_reais(valor)
    number_to_currency(valor, :unit => 'R$', :format => '%u %n', :separator => ',', :delimiter => '.')
  end
end
