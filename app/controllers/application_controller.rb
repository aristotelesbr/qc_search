# frozen_string_literal: true

# Base controller
class ApplicationController < Sinatra::Base
  get '/' do
    request = if params[:init_date].present? && params[:end_date].present?
                {
                  init_date: params[:init_date],
                  end_date: params[:end_date],
                  page: params[:page]
                }
              else
                { init_date: params[:init_date], page: params[:page] }
              end

    questions = Questions::Searcheable::Flow.call(request)
    { data: questions.data[:result] }.to_json
  end
end
