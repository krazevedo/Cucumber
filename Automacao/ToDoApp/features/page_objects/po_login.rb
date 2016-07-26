
class LoginPage < SitePrism::Page
	set_url "#{$BASE_URL}/users/sign_in"

	element :username,  "input#user_email"
  	element :password,  "input#user_password" 
  	element :message_error, "div.alert-warning" 
  	
  def login(user, pass)
  	username.set(user)
    password.set(pass)
    click_on('Sign in')    
  end
end
