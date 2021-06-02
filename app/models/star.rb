class Star < ApplicationRecord
  belongs_to :starable, polymorphic: true
end
