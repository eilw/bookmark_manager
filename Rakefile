require_relative 'app'

task :upgrade do
  DataMapper.auto_upgrade!
  puts "Upgrade completed"
end

task :migrate do
  DataMapper.auto_migrate!
  puts "Migrate completed"
end
