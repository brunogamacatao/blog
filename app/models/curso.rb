class Curso < ActiveRecord::Base
  extend FriendlyId
  
  # Atributos especiais
  friendly_id :nome, use: :slugged
  mount_uploader :imagem, ImagemUploader
  
  attr_accessible :descricao, :imagem, :inicio_previsto, :nome, :proxima_turma, :preco
  
  # Geração dos slugs
  def slug_candidates
    [
      :nome,
      [:nome, :id]
    ]
  end
end
