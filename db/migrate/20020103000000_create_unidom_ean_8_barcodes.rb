class CreateUnidomEan8Barcodes < ActiveRecord::Migration

  def change

    create_table :unidom_ean_8_barcodes, id: :uuid do |t|

      t.column :code,           'char(8)', null: false, default: '0'*8
      t.column :gs1_prefix,     'char(3)', null: false, default: '0'*3
      t.column :item_reference, 'char(4)', null: false, default: '0'*4
      t.column :check_digit,    'char(1)', null: false, default: '0'

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_ean_8_barcodes, :code, unique: true

  end

end
