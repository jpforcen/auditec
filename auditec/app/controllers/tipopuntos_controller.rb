class TipopuntosController < ActionController::Base
	def index
	  if(@tipoaspectos.eql?(nil))then
      @tipoaspectos = Array.new
    end
    if(!params[:bntipopunto].eql?(nil))then
      Tipopunto.create!(:nombre => params[:ntipopunto][0])     	
    end
    @tipopuntos = Tipopunto.all
    render :view  
  end  

	def edit
	  Tipopunto.find(params[:id]).update_attributes!(:nombre => params[:nombre]) 
    index
  end    

	def delete
	  Tipopunto.find(params[:id]).destroy  
	  index
  end
  
	def show
	  if(!params[:bntipoaspecto].eql?(nil))then
      Tipoaspecto.create!(:nombre => params[:ntipoaspecto][0],:peso => params[:npeso][0],:tipopunto_id => params[:id])
    end
    @tipopunto_id = params[:id]
    @tipoaspectos = Tipoaspecto.find_all_by_tipopunto_id(params[:id])	      
	  index
  end  
  
	def editTA
	  Tipoaspecto.find(params[:idta]).update_attributes!(:nombre => params[:nombre], :peso => params[:peso])   
	  @tipopunto_id = params[:id]  
	  @tipoaspectos = Tipoaspecto.find_all_by_tipopunto_id(params[:id])
    index
  end    
  
	def deleteTA
	  Tipoaspecto.find(params[:idta]).destroy   
	  @tipopunto_id = params[:id]  
	  @tipoaspectos = Tipoaspecto.find_all_by_tipopunto_id(params[:id])
    index
  end       
	
end
