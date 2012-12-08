class Event < ActiveRecord::Base
  belongs_to :identity

  validates_presence_of :identity_id, :name, :description,
    :start_date, :end_date, :location

end
