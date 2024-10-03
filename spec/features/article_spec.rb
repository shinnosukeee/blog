require 'rails_helper'

RSpec.feature 'Articles', type: :feature do
  scenario '記事の作成' do
    admin_user = AdminUser.create!(email: 'test@example.com', password: 'password')

    visit new_admin_user_session_path
    fill_in 'Email', with: admin_user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    visit new_article_path
    fill_in 'Title', with: 'テストタイトル'
    fill_in 'Content', with: 'テストコンテンツ'
    click_button 'Create Article'

    expect(page).to have_text('記事が作成されました。')
    expect(page).to have_text('テストタイトル')
    expect(page).to have_text('テストコンテンツ')
  end
end