require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'バリデーションのテスト' do
    it 'タイトルがなければ無効であること' do
      article = Article.new(title: '', content: 'テストコンテンツ')
      expect(article).not_to be_valid
    end

    it 'コンテンツがなければ無効であること' do
      article = Article.new(title: 'テストタイトル', content: '')
      expect(article).not_to be_valid
    end

    it 'タイトルとコンテンツがあれば有効であること' do
      article = Article.new(title: 'テストタイトル', content: 'テストコンテンツ')
      expect(article).to be_valid
    end
  end
end