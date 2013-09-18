ActiveAdmin.register Curso do
  form(:html => { :multipart => true }) do |f|
    f.inputs "Curso" do
      f.input :nome
      f.input :imagem, :as => :file
      f.input :preco
      f.input :tem_promocao
      f.input :preco_promocional
      f.input :descricao
      f.input :ementa, as: :wysihtml5
      f.input :inicio_previsto
      f.input :proxima_turma
    end
    f.buttons
  end
end
