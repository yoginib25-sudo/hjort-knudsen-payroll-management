class Employee < ApplicationRecord
  has_many :salary_slips, dependent: :destroy
end