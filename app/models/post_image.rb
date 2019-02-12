class PostImage < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	validates :shop_name,presence: true
	validates :image,presence: true

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def show
		@post_image = PostImage.find(params[:id])
		@post_comment = PostComment.new
	end
end
