class Curso < ActiveRecord::Base
  extend FriendlyId
  
  # Atributos especiais
  friendly_id :nome, use: :slugged
  mount_uploader :imagem, ImagemUploader
  
  attr_accessible :descricao, :imagem, :inicio_previsto, :nome, :proxima_turma
  attr_accessible :preco, :ementa, :tem_promocao, :preco_promocional
  
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
  
  scope :abertos,  -> { where(inicio_previsto: true).order("proxima_turma, id") }
  scope :proximos, -> { where(inicio_previsto: false).order("created_at") }
end
