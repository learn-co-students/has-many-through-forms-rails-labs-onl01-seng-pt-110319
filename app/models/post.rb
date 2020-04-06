class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(categories_attributes)
    categories_attributes.each do |k, cate_attr|
      if !cate_attr[:name].blank?
        @cate = Category.find_or_create_by(name: cate_attr[:name])
        if !self.categories.include?(@cate)
          self.post_categories.build(:category => @cate)
        end
      end
    end
  end

end
