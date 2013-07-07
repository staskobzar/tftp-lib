require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rdoc/task"

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = "--color"
end

desc "Run RSpec code example and output in doc format"
RSpec::Core::RakeTask.new(:spec_doc) do |t|
  t.rspec_opts = "--color --format doc"
end

desc "Run RSpec and build html report in spec/reports/index.html"
RSpec::Core::RakeTask.new(:spec_html) do |t|
  t.rspec_opts = "--format html -o spec/reports/index.html"
end

Rake::RDocTask.new do |rd|
  rd.main = "README.md"
  rd.rdoc_files.include("README.md","lib/**/*.rb")
  rd.title = 'TFTP: Ruby library implementin Trivial File Transfer Protocol RFC 1350'
  rd.rdoc_dir = "doc"
  rd.options << '--line-numbers'
  rd.options << '--all'
end

task :default => :spec
