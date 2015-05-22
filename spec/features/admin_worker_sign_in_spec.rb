describe "the signin process" do
  before :each do
    create(:admin_worker)
  end

  it "signs admin worker in and redirect to proper page" do
    visit '/admin_workers/sign_in'
    within("#new_admin_worker") do
      fill_in 'Email', :with => 'example@gmail.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Teachers'
  end
end