# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TipoDocumento.create(descripcion: 'DNI')
TipoDocumento.create(descripcion: 'LC')
TipoDocumento.create(descripcion: 'LE')
TipoDocumento.create(descripcion: 'CUIT')

Provincium.create(nombre: 'Buenos Aires')
Provincium.create(nombre: 'Chubut')

Localidad.create(nombre: 'La Plata', provincia_id: 1)
Localidad.create(nombre: 'Rawson', provincia_id: 2)
Localidad.create(nombre: 'Trelew', provincia_id: 2)

Persona.create(tipo_documento_id: 1, numero_documento: 31343209, apellido: 'Torsiglieri', nombre: 'Marcos', localidad_id: 1)
Persona.create(tipo_documento_id: 1, numero_documento: 32343209, apellido: 'Palama', nombre: 'Omar Arnaldo', localidad_id: 2)
Persona.create(tipo_documento_id: 1, numero_documento: 33343209, apellido: 'Gonzalez', nombre: 'Cristian', localidad_id: 1)
Persona.create(tipo_documento_id: 1, numero_documento: 34343209, apellido: 'Ruben', nombre: 'Marco', localidad_id: 1)
Persona.create(tipo_documento_id: 1, numero_documento: 35343209, apellido: 'Herrera', nombre: 'German', localidad_id: 2)
Persona.create(tipo_documento_id: 1, numero_documento: 36343209, apellido: 'Carrizo', nombre: 'Federico', localidad_id: 2)