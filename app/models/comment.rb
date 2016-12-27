class Comment < ApplicationRecord
	belongs_to :board

	validates :board, presence: {message: "タイトルを入力してください。"}
	validates :board, presence: {message: "名前を入力してください。"}
	validates :content, presence: {message: "文章を入力してください。"},
				length: {in: 1..1000}

end
