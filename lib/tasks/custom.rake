namespace :custom do
  desc "Wrapper task to invoke all tests for the website management project"
  task :test do
    Rake::Task['spec'].invoke
    Rake::Task['cucumber:all'].invoke
  end
end
