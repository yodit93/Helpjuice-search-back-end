# spec/models/search_query_spec.rb

require 'rails_helper'

RSpec.describe SearchQuery, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      search_query = SearchQuery.new(query: 'query', user_ip: '127.0.0.1')
      expect(search_query).to be_valid
    end

    it 'is not valid without a query' do
      search_query = SearchQuery.new(user_ip: '127.0.0.1')
      expect(search_query).not_to be_valid
    end

    it 'is not valid without a user IP' do
      search_query = SearchQuery.new(query: 'query')
      expect(search_query).not_to be_valid
    end
  end
end
