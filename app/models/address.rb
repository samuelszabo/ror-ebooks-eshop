# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user

  def single_line
    "#{first_name.first}. #{surname}, #{street}, #{city}"
  end
end
