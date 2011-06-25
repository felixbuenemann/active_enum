require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe ActiveEnum::Storage::MemoryStore do
  it_behaves_like 'a store'
end
