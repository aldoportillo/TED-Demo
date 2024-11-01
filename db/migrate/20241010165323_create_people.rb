class CreatePeople < ActiveRecord::Migration[7.2]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :github_username
      t.string :quiz_result
      t.string :linkedin_url
      t.string :photo_url

      t.timestamps
    end
  end
end
