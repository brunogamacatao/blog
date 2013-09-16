class Curso < ActiveRecord::Base
  attr_accessible :descricao, :imagem, :inicio_previsto, :nome, :proxima_turma
  mount_uploader :imagem, ImagemUploader
end
