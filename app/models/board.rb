class Board < ApplicationRecord

has_many :comments, dependent: :destroy

validates :title,
presence: {message: "タイトルを入力してください。"}

validates :editor,
presence: {message: "作成者名を入力してください。"}
end
