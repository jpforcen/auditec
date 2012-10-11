class Tipopunto < ActiveRecord::Base
	has_many :tipoaspectos, :dependent => :destroy
	has_many :puntos, :dependent => :destroy
	def tiempo
	  horas = 0.0
	  usos = 0
	  puntos.each do |x| 
	  	if(!x.tiempo.eql?(nil))then
	  	   horas = horas + x.tiempo.to_i
	  	   usos = usos + 1 
	  	end
	  end	  
	  if(usos.eql?(0))then
	     return '-'
	  else	  
	     return "%2.2f" % [horas * 1.0 / usos]
	  end
  end
end