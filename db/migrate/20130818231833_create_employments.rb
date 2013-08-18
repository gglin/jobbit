class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.string :employee_id
      t.string :company_id
      t.string :title

      t.timestamps
    end
  end
end
