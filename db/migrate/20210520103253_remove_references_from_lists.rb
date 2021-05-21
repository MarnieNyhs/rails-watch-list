class RemoveReferencesFromLists < ActiveRecord::Migration[6.0]
  def change
    remove_reference :lists, :movie, null: false, foreign_key: true
    remove_reference :lists, :list, null: false, foreign_key: true
  end
end
