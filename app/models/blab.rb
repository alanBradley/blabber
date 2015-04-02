class Blab < ActiveRecord::Base
    #association added so that non-user can skip to url to add a blab
    belongs_to :user
    
end
