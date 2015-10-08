module Selectors
  Capybara.add_selector(:href) do
    xpath {|href| XPath.descendant[XPath.attr(:href).contains(href)] }
  end  
end