class Aspecto < ActiveRecord::Base
	belongs_to :punto
	belongs_to :tipoaspecto
end