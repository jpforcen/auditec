class Punto < ActiveRecord::Base
	belongs_to :proyecto
	belongs_to :tipopunto
	has_many :aspectos, :dependent => :destroy
	
	def nota
	  puntos = 0
	  totalpesos = 0
	  	
	  aspectos.each do |x| 
	  	if(x.peso.eql?('C'))then
  	  	if(!x.valor)then
	  	    puntos = 0
	  	    totalpesos = 1
	  	    break 
	  	  end
	  	else
	  	  totalpesos = totalpesos + x.peso.to_i
  	  	if(x.valor)then	  	
	  	    puntos = puntos + x.peso.to_i  
	  	  end
	    end
	  end
	  if(aspectos.size.eql?(0))then
	     return '-'
	  else
	     return "%2.2f" % [puntos * 10.0 / totalpesos]
	  end
  end
end