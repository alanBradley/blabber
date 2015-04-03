class Blab < ActiveRecord::Base
    #association added for voting capabilities 
    acts_as_votable
    #association added so that non-user can skip to url to add a blab
    belongs_to :user
    
end
