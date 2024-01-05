module Api
  class SearchQueriesController < ApplicationController
    def search
      query = params[:query]&.strip
      user_ip = request.remote_ip

      search_query = SearchQuery.new(query: query, user_ip: user_ip)

      if search_query.save
        render json: { message: 'Search query saved successfully.' }
      else
        render json: { errors: search_query.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def analytics
      user_ip = request.remote_ip
      user_search_hash = SearchQuery.where(user_ip: user_ip).group(:query).count

      if user_search_hash.present?
        queries = if params[:query].present?
                    # Filtering suggestions based on user input
                    user_search_hash.select { |query, _count| query.downcase.include?(params[:query].downcase) }
                  else
                    # Fetching mostly used queries as suggestions on page load
                    user_search_hash.sort_by { |_, count| -count }
                  end
        top_queries = queries.first(10).map { |query, count| { query: query, count: count } }
        render json: { top_queries: top_queries }
      else
        render json: { message: 'No query history available for this user.' }
      end
    end
  end
end
