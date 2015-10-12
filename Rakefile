require 'rake/testtask'
# require 'dotenv/tasks'

# task :mytask => :dotenv do
#     # things that require .env
# end

task default: 'test'

Rake::TestTask.new do |t|
  t.libs << 'spec'
  t.pattern = 'spec/**/*_spec.rb'
end
