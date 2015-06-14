require 'rails_helper'

feature 'client can fill in a quiz' do
  scenario 'starts with personal details' do
    visit '/'
    click_link 'Take Quiz'
    fill_in 'Company name', with: 'Ebay'
    fill_in 'Email', with: 'boss@ebay.com'
    select 'FMCG', from: 'Sector'
    select 'small', from: 'Size'
    click_button 'Start quiz'
    expect(page).to have_content 'Please answer as many questions as possible'
  end
  context 'after filling in details' do
    before do
      visit '/'
      click_link 'Take Quiz'
      fill_in 'Company name', with: 'Ebay'
      fill_in 'Email', with: 'boss@ebay.com'
      select 'FMCG', from: 'Sector'
      select 'small', from: 'Size'
      click_button 'Start quiz'
    end

    scenario 'fills in strategy' do
      select '3', from: 's1_1_current'
      select '4', from: 's1_1_target'
      select '2', from: 's1_2_current'
      select '5', from: 's1_2_target'
      click_button 'Next section'
      expect(page).to have_content 'Please answer as many questions as possible'
    end

    context 'and filling in strategy' do
      before do
        select '3', from: 's1_1_current'
        select '4', from: 's1_1_target'
        select '2', from: 's1_2_current'
        select '5', from: 's1_2_target'
        click_button 'Next section'
      end

      scenario ', then fills in the rest' do
        select '3', from: 'p1_1_current'
        select '4', from: 'p1_1_target'
        select '2', from: 'p1_2_current'
        select '5', from: 'p1_2_target'
        click_button 'Next section'
        select '3', from: 't1_1_current'
        select '4', from: 't1_1_target'
        select '2', from: 't1_2_current'
        select '5', from: 't1_2_target'
        click_button 'Next section'
        select '3', from: 'pe1_1_current'
        select '4', from: 'pe1_1_target'
        select '2', from: 'pe1_2_current'
        select '5', from: 'pe1_2_target'
        click_button 'Next section'
        expect(page).to have_content 'Results'
      end
    end
  end
end