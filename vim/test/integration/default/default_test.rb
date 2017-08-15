# # encoding: utf-8

# Inspec test for recipe vim::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/usr/bin/vim') do
  it { should exist }
  it { should_not be_symlink }
end
