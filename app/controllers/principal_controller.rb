class PrincipalController < ApplicationController
  def index
    @cursos = Curso.order("proxima_turma, id")
  end
end
