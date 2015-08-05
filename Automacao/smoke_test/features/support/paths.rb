module NavigationHelpers
  def path_to(page_name)

    case page_name
    when /painel brasil/
      $BASE_URL
    when /página de meus dados/
      $BASE_URL + '/#/meus-dados'  
    when /página de personalização/
      $BASE_URL + '/#/personalizacao-do-espaco'  
    when /página de visitas/
      $BASE_URL + '/#/visitas'  
    when /página de clientes/
      $BASE_URL + '/#/clientes'  
    when /página de pedidos/
      $BASE_URL + '/#/pedidos'  
    when /página de cupons/
      $BASE_URL + '/#/cupons-desconto'  
    when /página de sacolas abandonadas/
      $BASE_URL + '/#/sacolas-abandonadas'  
    when /página de ofereça também/
      $BASE_URL + '/#/lealdade/ofereca-tambem'  
    when /página de ofereça de novo/
      $BASE_URL + '/#/lealdade/ofereca-de-novo'  
    when /página de aniversariantes/
      $BASE_URL + '/#/lealdade/aniversariantes'  
    when /página de aprenda mais vídeos/
      $BASE_URL + '/#/aprenda-mais-videos'
    when /página de aprenda mais artigos/
      $BASE_URL + '/#/aprenda-mais-artigos'      
    when /página de campanhas/
      $BASE_URL + '/#/campanhas'  
    when /página de material de apoio/
      $BASE_URL + '/#/adquira-material-de-apoio'
    when /página de conteúdo digital/
      $BASE_URL + '/#/conteudo-digital-gratuito'
    when /página de fanpage/
      $BASE_URL + '/#/minha-fanpage'
    when /página de fale com a gente/
      $BASE_URL + '/#/fale-com-a-gente'
    when /página de faq/
      $BASE_URL + '/#/ajuda'
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