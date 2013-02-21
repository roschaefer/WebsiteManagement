Given /^the following files are located in the websites folder?$/ do |table|
  table.hashes.each do |hash|
    pathname = Rails.root.join('app','views','websites', hash[:path])
    File.exist?(pathname).should be_true
    File.open(pathname, 'rb') do |f|
      f.read.should be_eql(hash[:content])
    end
  end
end
