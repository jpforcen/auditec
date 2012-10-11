class SubirController < ActionController::Base
	def view

  end   
  
  def upload
    puts "+++++"+params['myfile'].tempfile.path
    redirect_to :action=>:view
  end
end
