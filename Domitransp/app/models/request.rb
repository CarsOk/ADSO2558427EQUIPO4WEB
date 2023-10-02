class Request < ApplicationRecord
    has_many :responses, dependent: :destroy    
end
