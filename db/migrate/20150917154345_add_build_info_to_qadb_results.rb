class AddBuildInfoToQadbResults < ActiveRecord::Migration
  def up
    add_column :qadb_results, :product, :string
    add_column :qadb_results, :release, :string
  end
end
