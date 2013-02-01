Sequel.migration do 
  change do
    create_table :page_views do
      primary_key :id
      String      :url,        :null => false
      String      :referrer,   :null => true
      DateTime    :created_at, :null => false
      String      :digest
    end
  end
end
