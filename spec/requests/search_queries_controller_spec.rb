# spec/requests/api/search_queries_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::SearchQueriesController, type: :request do
  describe 'POST #search' do
    it 'creates a new search query' do
      post '/api/search', params: { query: 'sample query'}

      expect(response).to have_http_status(:success)
      expect(SearchQuery.count).to eq(1)
      expect(SearchQuery.first.query).to eq('sample query')
    end
    it 'returns errors if user_ip is missing' do
      post '/api/search', params: { query: '' }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to have_key('errors')
    end
  end
  describe 'GET #analytics' do
    it 'returns top queries for a user' do
      # Assuming some search queries are already created for the user's IP
      SearchQuery.create(query: 'test query', user_ip: '127.0.0.1')

      get '/api/search_queries/analytics', params: { query: 'test' }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to have_key('top_queries')
    end

    it 'returns no query history message for a user with no history' do
      get '/api/search_queries/analytics'

      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to have_key('message')
    end

    context 'when params[:query] is present' do
      it 'filters top queries based on user input' do
        SearchQuery.create(query: 'Test query', user_ip: '127.0.0.1')
        SearchQuery.create(query: 'Another query', user_ip: '127.0.0.1')

        get '/api/search_queries/analytics', params: { query: 'test' }

        expect(response).to have_http_status(:success)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to have_key('top_queries')
        expect(parsed_response['top_queries']).to include(a_hash_including('query' => 'Test query'))
        expect(parsed_response['top_queries']).not_to include(a_hash_including('query' => 'Another query'))
      end
      it 'response includes queries that matches with the user query' do
        SearchQuery.create(query: 'Test query', user_ip: '127.0.0.1')
        SearchQuery.create(query: 'Another query', user_ip: '127.0.0.1')

        get '/api/search_queries/analytics', params: { query: 'test' }


        parsed_response = JSON.parse(response.body)
        expect(parsed_response['top_queries']).to include(a_hash_including('query' => 'Test query'))
      end

      it 'response excludes queries that doesnot matche with the user query' do
        SearchQuery.create(query: 'Test query', user_ip: '127.0.0.1')
        SearchQuery.create(query: 'Another query', user_ip: '127.0.0.1')

        get '/api/search_queries/analytics', params: { query: 'test' }

        parsed_response = JSON.parse(response.body)
        expect(parsed_response['top_queries']).not_to include(a_hash_including('query' => 'Another query'))
      end
    end

    context 'when params[:query] is absent' do
      it 'returns mostly used queries as suggestions' do
        SearchQuery.create(query: 'Test query', user_ip: '127.0.0.1')
        SearchQuery.create(query: 'Another query', user_ip: '127.0.0.1')
        SearchQuery.create(query: 'Yet another query', user_ip: '127.0.0.1')

        get '/api/search_queries/analytics'

        expect(response).to have_http_status(:success)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to have_key('top_queries')
        expect(parsed_response['top_queries']).to include(a_hash_including('query' => 'Test query'))
        expect(parsed_response['top_queries']).to include(a_hash_including('query' => 'Another query'))
        expect(parsed_response['top_queries']).to include(a_hash_including('query' => 'Yet another query'))
      end
    end
  end
end
