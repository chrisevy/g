class JoinTableTagGossip < ApplicationRecord
    belongs_to :tag, optional: true
    belongs_to :gossip,optional: true
end