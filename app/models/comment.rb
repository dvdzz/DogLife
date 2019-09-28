class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :dog
  
    RATINGS = {
      'one dog': '1_star',
      'two dogs': '2_stars',
      'three dogs': '3_stars',
      'four dogs': '4_stars',
      'five dogs': '5_stars'
    }

    def humanized_rating
        RATINGS.invert[self.rating]
    end



end
