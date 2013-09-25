ActiveAdmin.register Curso do
  collection_action :gerar_thumbnails do
    Curso.all do |curso| 
      curso.imagem.recreate_versions!
      curso.save!
    end
    redirect_to :action => :index, :notice => "Thumbnails gerados com sucesso !"
  end

  index do   
    column :imagem do |curso|
      image_tag curso.imagem_url(:mini_thumb) if curso.imagem? 
    end
    column :nome
    column :inicio_previsto
    column :created_at
    default_actions
  end
  
  action_item :only => :index do
    link_to 'Gerar Thumbnails', gerar_thumbnails_admin_cursos_path
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Curso" do
      f.input :nome
      f.input :aviso
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
