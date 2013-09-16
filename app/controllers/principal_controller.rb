class PrincipalController < ApplicationController
  def index
    @cursos = Curso.order("proxima_turma, id")
  end
  
  def sobre
  end
  
  def detalhe
    @curso = Curso.find(params[:id])
  end
end
