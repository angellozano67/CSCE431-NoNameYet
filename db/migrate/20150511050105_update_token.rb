class UpdateToken < ActiveRecord::Migration
  def change
    change_table 'tokens' do |t|
        rename_column 'tokens', 'update_at', 'updated_at'
    end
  end
end
