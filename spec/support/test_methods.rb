def sign_in
  visit '/'
  click_link('Sign in')
  fill_in 'Email', with: 'anothertest@test.com'
  fill_in 'Password', with: 'testtest'
  click_button 'Log in'
end

def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  fill_in('User name', with: 'test')
  click_button('Sign up')
end

def sign_up_alt
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  fill_in('User name', with: 'test2')
  click_button('Sign up')
end

def create_post
  user = User.create(email: "anothertest@test.com", password: "testtest", user_name: "test")
  Post.create title: 'Me with my dog', user: user
end