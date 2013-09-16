class Matricula < ActiveRecord::Base
  belongs_to :curso
  belongs_to :user
  attr_accessible :estado_cd, :curso_id, :user_id, :estado
  
  as_enum :estado, :reservada => 0, :confirmada => 1, :cancelada => 2
end
