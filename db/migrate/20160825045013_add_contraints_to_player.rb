class AddContraintsToPlayer < ActiveRecord::Migration
  execute <<-SQL
    alter table players alter column name set not null;
  SQL
end

def down
  execute <<-SQL
    alter table players alter name drop not null;
  SQL
end
