class CreateCaptchas < ActiveRecord::Migration
  def change
    create_table :captchas do |t|
      t.integer :code
      t.integer :mobile

      t.timestamps
    end
  end
end
