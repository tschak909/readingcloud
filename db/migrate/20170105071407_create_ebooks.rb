class CreateEbooks < ActiveRecord::Migration[5.0]
  def change
    create_table :ebooks do |t|
      t.string :originalfile
      t.string :title
      t.string :titles
      t.string :languages
      t.string :contributors
      t.string :coverages
      t.string :creators
      t.string :dates
      t.string :descriptions
      t.string :formats
      t.string :publishers
      t.string :relations
      t.string :rights
      t.string :sources
      t.string :subjects
      t.string :types
      t.string :uniqueid
      t.string :epubver

      t.timestamps
    end
  end
end
