class Blab < ActiveRecord::Base
    #association added for voting capabilities 
    acts_as_votable
    #association added so that non-user can skip to url to add a blab
    belongs_to :user
    belongs_to :category
    has_many :comments 
    has_attached_file :image, styles: { large: "600x600", medium: "300x300", thumb: "150x150#"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
