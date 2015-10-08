module NavigationHelpers
  def path_to(page_name)

    case page_name
    when /painel drupal/
      $BASE_URL + '/login'
    when /conteúdos/
      $BASE_URL + '/admin/content'  
    when /artigos/
      $BASE_URL + '/node/add/learning-more-articles'        
    when /videos/
      $BASE_URL + '/node/add/learning-more-videos'        
    when /banner/
      $BASE_URL + '/node/add/banner-home-carousel'        
    when /comunicados/
      $BASE_URL + '/node/add/informs'        
    when /faq/
      $BASE_URL + '/node/add/frequently-asked-questions'        
    when /material de apoio/
      $BASE_URL + '/node/add/support-material'        
    when /posts/
      $BASE_URL + '/node/add/community-posts'
    when /conteúdo digital/
      $BASE_URL + '/node/add/free-digital-content'          
    when /the home\s?page/
      '/'
    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)