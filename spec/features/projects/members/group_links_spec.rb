require 'spec_helper'

feature 'Projects > Members > Anonymous user sees members', feature: true, js: true do
  let(:user) { create(:user) }
  let(:group) { create(:group, :public) }
  let(:project) { create(:empty_project, :public) }

  background do
    project.team << [user, :master]
    @group_link = create(:project_group_link, project: project, group: group)

    login_as(user)
    visit namespace_project_settings_members_path(project.namespace, project)
  end

  it 'updates group access level' do
    click_button @group_link.human_access

    page.within '.dropdown-menu' do
      click_link 'Guest'
    end

    wait_for_requests

    visit namespace_project_settings_members_path(project.namespace, project)

    expect(first('.group_member')).to have_content('Guest')
  end

  it 'updates expiry date' do
    tomorrow = Date.today + 3

    fill_in "member_expires_at_#{group.id}", with: tomorrow.strftime("%F")
    wait_for_requests

    page.within(find('li.group_member')) do
      expect(page).to have_content('Expires in')
    end
  end

  it 'deletes group link' do
    page.within(first('.group_member')) do
      find('.btn-remove').click
    end
    wait_for_requests

    expect(page).not_to have_selector('.group_member')
  end

  context 'search' do
    it 'finds no results' do
      page.within '.member-search-form' do
        fill_in 'search', with: 'testing 123'
        find('.member-search-btn').click
      end

      expect(page).not_to have_selector('.group_member')
    end

    it 'finds results' do
      page.within '.member-search-form' do
        fill_in 'search', with: group.name
        find('.member-search-btn').click
      end

      expect(page).to have_selector('.group_member', count: 1)
    end
  end
end
