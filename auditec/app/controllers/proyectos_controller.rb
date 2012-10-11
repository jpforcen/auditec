class ProyectosController < ActionController::Base

	def index
	  @tipopuntos = Hash.new
	  Tipopunto.all.each {|x| @tipopuntos[x.id]=x}
    @aspectos = Array.new	 
	  @punto = Punto.new
  	if(params[:cadena].eql?(nil))then	
		  @proyecto = Proyecto.new
		  @puntos = Array.new
		else
      @proyecto = Proyecto.find_by_codigo(params[:cadena])
      if(@proyecto.eql?(nil))then
        @proyecto = Proyecto.new      
        @proyecto.codigo = params[:cadena]
        @puntos = Array.new
      else
        @puntos = Punto.where(:proyecto_id => @proyecto.id)
    	end		
	  end
	  render :view
  end  
  
  def create
    @proyecto = Proyecto.create!(:nombre => params[:nombre],:codigo=>params[:codigo],:responsable=>params[:responsable]) 
	  show 
	end  
  
	def show
    id = params[:id]
    @tipopuntos = Hash.new
    Tipopunto.all.each {|x| @tipopuntos[x.id]=x}
    if(@aspectos.eql?(nil))then
       @aspectos = Array.new	 
    end
    if(@punto.eql?(nil))then
       @punto = Punto.new
    end
    if(@proyecto.eql?(nil))then
   	   @proyecto = Proyecto.find(id)
   	end
	  if(!params[:bnpunto].eql?(nil))then
	     Punto.create!(:proyecto_id =>params[:id], :tipopunto_id=> params[:npunto], :nombre=> params[:nombre][0], :fecha=> Date.civil(params[:npuntofecha]["(1i)"].to_i,
                         params[:npuntofecha]["(2i)"].to_i,
                         params[:npuntofecha]["(3i)"].to_i))
	  end
    @puntos = Punto.where(:proyecto_id => @proyecto.id)
		render :view
  end

  def edit
    Proyecto.find(params[:id]).update_attributes!(:nombre => params[:nombre],:codigo=>params[:codigo],:responsable=>params[:responsable]) 
	  show 
	end
	
  def editPC
    Punto.find(params[:idpc]).update_attributes!(:nombre => params[:nombre],:tiempo=>params[:tiempo]) 
	  show 
	end

  def createA
 	  Punto.find(params[:idpc]).tipopunto.tipoaspectos.each {|x| Aspecto.create!(:punto_id =>params[:idpc], :nombre=> x.nombre, :peso=> x.peso, :tipoaspecto_id =>x.id)}
 	  showPC
  end
  
  def showPC
    @punto = Punto.find(params[:idpc])	
    @aspectos = Aspecto.find_all_by_punto_id(params[:idpc])
	  show 
	end
	
  def deletePC
    @punto = Punto.find(params[:idpc])	
    Punto.find(params[:idpc]).destroy
	  show 
	end	
	
	def editA
	  if(params[:baspecto].eql?(nil))then
      @aspecto = Aspecto.find(params[:ida])	
      @aspecto.update_attributes!(:valor => !@aspecto.valor) 
    else
      Aspecto.find(params[:ida]).update_attributes!(:justificacion => params[:justificacion]) 
    end
    showPC
  end

end