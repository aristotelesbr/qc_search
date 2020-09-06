# frozen_string_literal: true

module QuesitonSearchable
  extend ActiveSupport::Concern

  included do
    searchkick

    def search_data
      {
        id: id,
        daily_access: daily_access,
        discipline: discipline,
        created_at: created_at.to_time
      }
    end
  end
end
