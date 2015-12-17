class CreateUnidomMarkings < ActiveRecord::Migration

  def change

    create_table :unidom_markings, id: :uuid do |t|

      t.references :barcode, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :marked,  type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :marker,  type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_markings, :barcode_id
    add_index :unidom_markings, :marked_id
    add_index :unidom_markings, :marker_id

  end

end
