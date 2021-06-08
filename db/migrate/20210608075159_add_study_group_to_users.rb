class AddStudyGroupToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :study_group, :string
  end
end
