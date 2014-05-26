desc "run unit tests after deploy"
task :before_deploy => :environment do
 
puts "-----> running rspec unit tests"
system("rake spec") ? true : fail
puts "-----> done"
end
