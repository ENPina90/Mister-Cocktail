class IngredientsController < ApplicationController
  def create
    new_ingredient = Ingredient.new(restaurant_params)
    new_ingredient.save
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
