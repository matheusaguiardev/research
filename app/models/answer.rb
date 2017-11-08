class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question


  accepts_nested_attributes_for :user, :question

  validates_presence_of :question_id
  validates_presence_of :user_id

end
