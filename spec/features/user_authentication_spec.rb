## Tests written in psuedocode

feature 'User authentication' do
  scenario 'user can sign up' do

      click_on 'Sign Up'
      expect(current_path).to eq signup_path

     #fill in form items

     #click submit

     #expect a user to be created and redirect to index

  end
end
