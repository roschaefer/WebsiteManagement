Given /^the following files are located in the websites folder?$/ do |table|
  table.hashes.each do |hash|
    pathname = Rails.root.join('app','views','websites', hash[:path])
    # TODO: implement a careful file creation and clean up eventually
    # File.exist?(pathname).should be_false
    File.open(pathname, 'w') {|file| file.write(hash[:content])}
  end
end
