require 'spec_helper'

describe 'get merchants' do
  subject do
    Cashstar::Client.new(DEFAULT_OPTIONS)
  end

  before do
    stub_get('v2/merchant', 'merchants')
  end

  it 'returns merchants' do
    subject.merchants.should == [ { 'name'          => 'Widget Store',
                                    'legal_name'    => 'The Widget Store, Inc.',
                                    'merchant_code' => 'TWS' },
                                  { 'name'          => 'Yummy Food',
                                    'legal_name'    => 'Yummy Food',
                                    'merchant_code' => 'YUM' } ]
  end
end
