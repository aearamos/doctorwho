class FixRatinginReviews < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :Rating, :rating
  end
end
