Sequel.migration do
  change do
    create_table(:page_views) do
      primary_key :id, :type=>"int(11)"
      column :url, "varchar(255)", :null=>false
      column :referrer, "varchar(255)"
      column :created_at, "datetime", :null=>false
      column :digest, "varchar(255)"
    end
    
    create_table(:schema_migrations) do
      column :filename, "varchar(255)", :null=>false
      
      primary_key [:filename]
    end
  end
end
