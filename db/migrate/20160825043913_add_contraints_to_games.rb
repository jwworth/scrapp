class AddContraintsToGames < ActiveRecord::Migration
  def up
    execute <<-SQL
      alter table games alter column winner_id set not null;
      alter table games alter column loser_id set not null;

      alter table games alter column winner_score set not null;
      alter table games alter column winner_score set default 1;

      alter table games alter column loser_score set not null;
      alter table games alter column loser_score set default 0;
    SQL
  end

  def down
    execute <<-SQL
      alter table games alter column winner_id drop not null;
      alter table games alter column loser_id drop not null;
      alter table games alter column winner_score drop not null;
      alter table games alter column loser_score drop not null;
    SQL
  end
end
