desc "Generate code examples statistics"
task :coverage do
  ENV['COVERAGE'] = 'true'

  Rake::Task['spec'].execute
end

