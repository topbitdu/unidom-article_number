class CreateUnidomVehicleIdentificationNumbers < ActiveRecord::Migration

  def change

    create_table :unidom_vehicle_identification_numbers, id: :uuid do |t|

      t.column :code,                          'char(17)', null: false, default: '0'*17
      t.column :world_manufacturer_identifier, 'char(3)',  null: false, default: '0'*3
      t.column :vehicle_descriptor_section,    'char(5)',  null: false, default: '0'*5
      t.column :check_digit,                   'char(1)',  null: false, default: '0'
      t.column :vehicle_identifier_section,    'char(8)',  null: false, default: '0'*8

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_vehicle_identification_numbers, :code, unique: true

  end

end
