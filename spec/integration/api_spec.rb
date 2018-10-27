# spec/integration/pets_spec.rb
require 'swagger_helper'

describe 'Personas API' do

  path '/personas' do

    post 'Crea una persona' do
      tags 'Personas'
      consumes 'application/json', 'application/xml'
      parameter name: :persona, in: :body, schema: {
        type: :object,
        properties: {
          tipo_documento_id: { type: :integer },
          numero_documento: { type: :integer },
          apellido: { type: :string },
          nombre: { type: :string },
          localidad_id: { type: :integer }
        },
        required: [ 'dni', 'apellido', 'nombre' ]
      }

      response '201', 'persona creada' do
        let(:persona) { { tipo_documento_id: 1, numero_documento: 31343209, apellido: 'Moreno', nombre: 'Martin', localidad_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:persona) { { nombre: 'foo' } }
        run_test!
      end
    end
  end

  path '/personas' do

    get 'Obtiene todas las personas' do
      tags 'Personas'
      produces 'application/json', 'application/xml'

      response '404', 'url invalida' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/personas/{id}' do

    get 'Obtiene una persona' do
      tags 'Personas'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :integer

      response '200', 'id encontrado' do
        schema type: :object,
          properties: {
            tipo_documento_id: { type: :integer },
            numero_documento: { type: :integer },
            apellido: { type: :string },
            nombre: { type: :string },
            localidad_id: { type: :integer }
          },
          required: [ 'id', 'dni', 'apellido', 'nombre' ]

        let(:id) { Persona.create(tipo_documento_id: 1, numero_documento: 31343209, apellido: 'Moreno', nombre: 'Martin', localidad_id: 1).id }
        run_test!
      end

      response '404', 'persona no encontrada' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/personas/{id}' do

    put 'Actualiza una persona' do
      tags 'Personas'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :integer
      parameter name: :persona, in: :body, schema: {
        type: :object,
        properties: {
          tipo_documento_id: { type: :integer },
          numero_documento: { type: :integer },
          apellido: { type: :string },
          nombre: { type: :string },
          localidad_id: { type: :integer }
        },
        required: [ 'dni', 'apellido', 'nombre' ]
      }

      response '200', 'id encontrado' do
        schema type: :object,
          properties: {
            tipo_documento_id: { type: :integer },
            numero_documento: { type: :integer },
            apellido: { type: :string },
            nombre: { type: :string },
            localidad_id: { type: :integer }
          },
          required: [ 'id', 'dni', 'apellido', 'nombre' ]

        let(:id) { Persona.create(tipo_documento_id: 1, numero_documento: 31343209, apellido: 'Moreno', nombre: 'Martin', localidad_id: 1).id }
        run_test!
      end

      response '404', 'persona no encontrada' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/personas/{id}' do

    delete 'Elimina una persona' do
      tags 'Personas'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :integer

      response '200', 'id encontrado' do
        schema type: :object,
          properties: {
            tipo_documento_id: { type: :integer },
            numero_documento: { type: :integer },
            apellido: { type: :string },
            nombre: { type: :string },
            localidad_id: { type: :integer }
          },
          required: [ 'id', 'dni', 'apellido', 'nombre' ]

        let(:id) { Persona.create(tipo_documento_id: 1, numero_documento: 31343209, apellido: 'Moreno', nombre: 'Martin', localidad_id: 1).id }
        run_test!
      end

      response '404', 'persona no encontrada' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end