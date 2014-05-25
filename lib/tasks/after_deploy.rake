desc "run unit tests after deploy"
task :after_deploy => :environment do
 
puts "-----> running rspec unit tests"
system("rake spec") ? true : fail
puts "-----> done"
end
