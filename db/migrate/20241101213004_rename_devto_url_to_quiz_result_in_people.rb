class RenameDevtoUrlToQuizResultInPeople < ActiveRecord::Migration[7.2]
  def change
    rename_column :people, :devto_url, :quiz_result
  end
end
