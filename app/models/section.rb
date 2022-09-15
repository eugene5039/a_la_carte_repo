# frozen_string_literal: true

class Section < ApplicationRecord
  belongs_to :recipe

  has_many :recipe_ingredients
  has_many :steps
  has_many :recipe_equipments

  validates :name, presence: true,
                   length: { maximum: 100 }
  validates :sort_number, presence: true

  def remove_recipe_equipments(updated_equipment_ids)
    Rails.logger.debug("Section: #{self}")
    recipe_equipments.each do |recipe_equipment|
      recipe_equipment&.destroy unless recipe_equipment.id.in?(updated_equipment_ids)
    end
  end
end
