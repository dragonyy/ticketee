class ProjectsController < ApplicationController
  
  def index 
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    # 加了 validates 後，成功傳回 true / 失敗傳回 false
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash[:alert] = "Project has not been created."

      render :action => "new"
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private
    def project_params
      params.require(:project).permit(:name, :description)
    end

end
