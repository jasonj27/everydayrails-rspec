class Note < ApplicationRecord
  belongs_to :user
  belongs_to :project

  delegate :name, to: :user, prefix: true
  #note.user_name returns note.user.name

  scope :search, ->(term) {
    where("message LIKE ?", "%#{term}")
  }
end
