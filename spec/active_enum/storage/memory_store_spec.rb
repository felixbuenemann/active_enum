require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe ActiveEnum::Storage::MemoryStore do
  let(:store) { described_class.new(TestStoreEnum, @order) }
  let(:alt_store) { described_class.new(TestOtherAREnum, :asc) }

  it_behaves_like 'a store'
end
