class Curso < ActiveRecord::Base
  extend FriendlyId
  
  # Atributos especiais
  friendly_id :nome, use: :slugged
  mount_uploader :imagem, ImagemUploader
  
  attr_accessible :descricao, :imagem, :inicio_previsto, :nome, :proxima_turma, :preco, :ementa
  
  has_many :matriculas
  
  # Geração dos slugs
  def slug_candidates
    [
      :nome,
      [:nome, :id]
    ]
  end
  
  def matriculado?(user)
    matriculas.where("user_id = ? AND estado_cd = ?", user.id, Matricula.estados(:confirmada)).exists?
  end
end
