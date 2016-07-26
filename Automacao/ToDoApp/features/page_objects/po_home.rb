
class MenuSection < SitePrism::Section
  elements :menu_left,  "ul.navbar-nav li a"  
end

class HomePage < SitePrism::Page
	set_url "#{$BASE_URL}"	
  	element :message_success,  "div.alert-info"    
  	section :menu, MenuSection, "div.navbar-collapse"		
end