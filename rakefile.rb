require 'data_mapper'
require_relative 'app.rb'


namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Auto_upgrade complete'
  end

  desc "destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'auto_migrate complete (data was lost)'
  end
end
