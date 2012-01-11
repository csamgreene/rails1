
require 'spec_helper'


describe 'GET /' do

  context 'text/html' do

    it 'returns some html' do

      get '/'

      response.status.should == 200
      response.content_type.should == 'text/html'
    end

    it 'returns something' do

      visit '/'

      page.should have_selector('div')
    end
  end
end

