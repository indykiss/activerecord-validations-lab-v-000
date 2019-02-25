class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates_with MyValidator




end


class MyValidator < ActiveModel::Validator
  def validate(post)
      unless post.title.include? == ('Believe' || 'Secret' || 'Top [number]' || 'Guess')
        post.errors[:title] << 'must include clickbait'
      end
    end
end
