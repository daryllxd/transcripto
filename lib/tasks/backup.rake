# frozen_string_literal: true
namespace :db do
  desc 'Backs up the database'
  task backup: :environment do
    system("pg_dump transcripto_development > transcripto-db-backup/backups/transcripto_development-#{DateTime.current}.sql")
    system("cd transcripto-db-backup && git add . && git commit -m 'Backup.' && git push")
    Growler::Client.instance.backed_up_database
  end
end
