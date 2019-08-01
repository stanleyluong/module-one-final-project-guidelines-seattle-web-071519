class Relationship < ActiveRecord::Base
    belongs_to :user
    belongs_to :npc
end
