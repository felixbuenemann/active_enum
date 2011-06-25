require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

class TranslatedEnum < ActiveEnum::Base; end

describe ActiveEnum::Storage::I18nMemoryStore do
  before do
    I18n.backend.store_translations('en', 'active_enum' => {
        'translated_enum' => {'something' => 'gnihtemos', 'other' => 'rehto'}})
  end

  let(:store) { described_class.new(TestStoreEnum, @order) }
  let(:alt_store) { described_class.new(TestOtherAREnum, :asc) }
  let(:store_with_translations) { described_class.new(TranslatedEnum, :as_defined) }

  it_behaves_like 'a store'

  describe '#values' do
    it 'should return values with translations' do
      store_with_translations.set 1, 'something'
      store_with_translations.set 2, 'other'
      store_with_translations.values.should == [[1, 'gnihtemos'], [2, 'rehto']]
    end
  end

  describe '#get_by_id' do
    it 'should return a translated value' do
      store_with_translations.set 1, 'something'
      store_with_translations.get_by_id(1).should == [1, 'gnihtemos']
    end
  end

  describe '#get_by_name' do
    it 'should return a translated value' do
      store_with_translations.set 1, 'something'
      store_with_translations.get_by_name('something').should == [1, 'gnihtemos']
    end
  end
end
