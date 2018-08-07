class Topic < ApplicationRecord
    validates_presence_of :title

    # Relationship
    has_many :blogs
end
