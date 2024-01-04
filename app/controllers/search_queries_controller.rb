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
      top_queries = user_search_hash.sort_by { |_, count| -count }.first(10).to_h
      render json: { top_queries: top_queries }
    else
      render json: { message: 'No query history available for this user.' }, status: :not_found
    end
  end


end
