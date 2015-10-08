module NavigationHelpers
  def path_to(page_name)

    case page_name
    when /painel/
      $BASE_URL
    when /meus dados/
      $BASE_URL + '/#/meus-dados'  
    when /personalização/
      $BASE_URL + '/#/personalizacao-do-espaco'  
    when /visitas/
      $BASE_URL + '/#/visitas'  
    when /clientes/
      $BASE_URL + '/#/clientes'  
    when /pedidos/
      $BASE_URL + '/#/pedidos'  
    when /cupons/
      $BASE_URL + '/#/cupons-desconto'  
    when /sacolas abandonadas/
      $BASE_URL + '/#/sacolas-abandonadas'  
    when /ofereça também/
      $BASE_URL + '/#/lealdade/ofereca-tambem'  
    when /ofereça de novo/
      $BASE_URL + '/#/lealdade/ofereca-de-novo'  
    when /aniversariantes/
      $BASE_URL + '/#/lealdade/aniversariantes'  
    when /aprenda mais vídeos/
      $BASE_URL + '/#/aprenda-mais-videos'
    when /aprenda mais artigos/
      $BASE_URL + '/#/aprenda-mais-artigos'      
    when /campanhas/
      $BASE_URL + '/#/campanhas'  
    when /material de apoio/
      $BASE_URL + '/#/adquira-material-de-apoio'
    when /conteúdo digital/
      $BASE_URL + '/#/conteudo-digital-gratuito'
    when /fanpage/
      $BASE_URL + '/#/minha-fanpage'
    when /fale com a gente/
      $BASE_URL + '/#/fale-com-a-gente'
    when /faq/
      $BASE_URL + '/#/duvidas-frequentes'
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