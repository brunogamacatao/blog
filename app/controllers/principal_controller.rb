class PrincipalController < ApplicationController
  def index
    @cursos = Curso.all
  end
end
