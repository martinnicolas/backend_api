class Localidad < ApplicationRecord
  belongs_to :provincia, foreign_key: :provincia_id, class_name: :Provincium
end
