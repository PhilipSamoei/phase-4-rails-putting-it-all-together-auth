class RecipesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound,with: :render_record_invalid_response
    before_action :authorize
    def index
        recipes = Recipe.all
        render json: recipes
    end
    def show
        recipe = find_recipe
        render json: recipe
    end
    def create
        recipe = Recipe.create!(recipe_params)
        render json: recipe
    end
    def update
        recipe = find_recipe
        recipe.update!(recipe_params)
        render json: recipe
    end
    def destroy
        recipe = find_recipe
        recipe.destroy
        head :no_content
    end
    private 
    def recipe_params
        params.permit(:title, :instructions , :minutes_to_complete, :user_id)
    end
    def find_recipe
        Recipe.find(params[:id])
    end

end
