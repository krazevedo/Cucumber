module NavigationHelpers
  def path_to(page_name)
    case page_name      
      when /goal/
        $BASE_URL
      when /project/
        $BASE_URL + '/Project.aspx'
      when /card reports/
        $BASE_URL + '/GoalReports.aspx?Mode=Cards'
      when /all reports/
        $BASE_URL + '/GoalReports.aspx?Mode=All'
      when /pml admin/
        $BASE_URL + '/PMLAdmin.aspx'
      when /pml/
        $BASE_URL + '/PML_Evaluation.aspx' 
      when /performance review/        
        $BASE_URL + '/PerformanceReview.aspx' 
      when /orm/
        $BASE_URL + '/OperationalRiskManagement.aspx'  
      when /raw/
        $BASE_URL + '/Raw_Report.aspx'  
      when /flow criteria/
        $BASE_URL + '/PMLReports.aspx?id=1'   
      when /flow/        
        $BASE_URL + '/FlowRegister.aspx'                
      when /smart canvas/
        'http://demo.tst.smartcanvas.io/'  
      when /pending/
        'http://demo.tst.smartcanvas.io/a/cards/pending'
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