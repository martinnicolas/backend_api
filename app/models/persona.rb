class Persona < ApplicationRecord
  belongs_to :tipo_documento
  belongs_to :localidad
end
