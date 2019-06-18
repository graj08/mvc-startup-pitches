class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |x|
      x.string :title
      x.string :industry
      x.float :funding
    end
  end
end
