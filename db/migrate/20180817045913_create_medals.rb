class CreateMedals < ActiveRecord::Migration[5.2]
  def change
    create_table :medals do |t|
      t.string :conuntry

      t.timestamps
    end
  end
end
