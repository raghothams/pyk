class Pyk::Highcharts
  
  # Pyk::Highcharts.pie(data, series_name, render_to_name, background_color)
  def self.pie(data, series_name, render_to_name, background_color, show_in_legend=false, data_labels=false)
    LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [0, 0, 0, 0], backgroundColor: background_color, renderTo: render_to_name})
      f.series({:type=> 'pie', :name=> series_name, :data=> data, borderWidth: 0})
      f.options[:title][:text] = nil
      f.legend(:layout=> 'vertical',:style=> {:left=> '0', :bottom=> '0',:right=> '0',:top=> '0'}) 
      f.plot_options(series: {pointPadding: 0,groupPadding: 0}, :pie=>{:allowPointSelect=>true, :cursor=>"pointer" , showInLegend: show_in_legend, :dataLabels=>{:enabled=>data_labels}})
    end
  end
  
  # Pyk::Highcharts.bar(data, categories, render_to_name, background_color)
  def self.bar(data, categories, render_to_name, background_color, show_in_legend=false, data_labels=false)
    LazyHighCharts::HighChart.new('column') do |f|
      f.chart({ backgroundColor: background_color, renderTo: render_to_name, defaultSeriesType: "bar"} )
      data.each do |d|
        f.series(:name=>d[0],:data=> d[1], borderWidth: 0)
      end
      f.xAxis({categories: categories, gridLineWidth: 0, :labels=>{:align => 'right'}, type: :string})
      f.yAxis({gridLineWidth: 0, title: nil, :min => 0})
      f.title({ :text=> nil})
      f.plot_options({:bar=>{:stacking=>"normal", dataLabels: {enabled: data_labels}, showInLegend: show_in_legend}})
    end
  end  
  
  # Pyk::Highcharts.column(data, categories, render_to_name, background_color)
  def self.column(data, categories, render_to_name, background_color, show_in_legend=false, data_labels=false, height=nil, stacking="normal")
    LazyHighCharts::HighChart.new('column') do |f|
      f.chart({ backgroundColor: background_color, renderTo: render_to_name, :defaultSeriesType=>"column", height: height} )
      data.each do |d|
        f.series(:name=>d[0],:data=> d[1], borderWidth: 0, color: d[2])
      end
      f.xAxis({categories: categories, gridLineWidth: 0, :labels=>{:align => 'center'}, type: :string})
      f.yAxis({gridLineWidth: 0, title: nil, :min => 0})
      f.title({ :text=> nil})
      f.plot_options({:column=>{:stacking=>stacking, dataLabels: {enabled: data_labels}, showInLegend: show_in_legend}})     
    end
  end
  
  # Pyk::Highcharts.column
  def self.area(data, categories, render_to_name, background_color, show_in_legend=false, data_labels=false, height=nil, stacking="normal")
    LazyHighCharts::HighChart.new('area') do |f|
      f.chart({ backgroundColor: background_color, renderTo: render_to_name, :defaultSeriesType=>"area", height: height} )
      data.each do |d|
        f.series(:name=>d[0],:data=> d[1], borderWidth: 0, color: d[2])
      end
      f.xAxis({categories: categories, tickmarkPlacement: 'on', title: { enabled: false }, :labels=>{:align => 'center'}, type: :string})
      f.yAxis({gridLineWidth: 0, title: nil, :min => 0})
      f.title({ :text=> nil})
      f.plot_options({:area=>{:stacking=>stacking, lineColor: '#666666', lineWidth: 1, dataLabels: {enabled: data_labels}, showInLegend: show_in_legend}})     
    end
  end
  
  def self.line(data, categories, render_to_name, background_color, show_in_legend=false, data_labels=false, height=nil)
    LazyHighCharts::HighChart.new('graph') do |f|
      f.chart({ backgroundColor: background_color, renderTo: render_to_name, :defaultSeriesType=>"line", height: height} )
      data.each do |d|
        f.series(:name=>d[0],:data=> d[1], color: d[2])
      end
      f.xAxis({categories: categories, title: { enabled: false }, :labels=>{:align => 'center'}, type: :string})
      f.yAxis({title: nil, plotLines: [{value: 0, width: 1, color: '#F7F7F7'}]})
      f.title({ :text=> nil})
      f.legend({ :enabled=> show_in_legend})
    end
  end
  
  # Pyk::Highcharts.donut(data, series_name, render_to_name, background_color)
  def self.donut(data, series_name, render_to_name, background_color, chart_title, show_in_legend=false, data_labels=false)
    LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [0, 0, 0, 0], backgroundColor: background_color, renderTo: render_to_name})
      f.title({verticalAlign: 'middle',floating: true,text: chart_title})
      f.series({:type=> 'pie', :name=> series_name, :data=> data, borderWidth: 0, innerSize: '67%', size: '100%'})
      f.legend(:layout=> 'vertical',:style=> {:left=> '0', :bottom=> '0',:right=> '0',:top=> '0'}) 
      f.plot_options(series: {pointPadding: 0,groupPadding: 0}, :pie=>{:allowPointSelect=>true, :cursor=>"pointer" , showInLegend: show_in_legend, :dataLabels=>{:enabled=>data_labels}})
    end
  end  
  
  # Pyk::Highcharts.areaspline_by_date(data, render_to_name, background_color, start_date, end_date)
  def self.areaspline_by_date(data, render_to_name, background_color, start_date, end_date, show_in_legend=false, data_labels=false)
    categories = []
    (start_date..end_date).each do |d|
      categories << d
    end
    return LazyHighCharts::HighChart.new('graph') do |f|
      f.chart({ backgroundColor: background_color, renderTo: render_to_name, :defaultSeriesType=>"areaspline"} )
      data.each do |d2|
        f.series(:name=>d2[0],:data=> d2[1], borderWidth: 0)
      end      
      f.xAxis({categories: categories, gridLineWidth: 0, :labels=>{:rotation=>-45 , :align => 'right'}, type: :datetime})
      f.legend({layout: "horizontal", :borderWidth => 0})
      f.yAxis({gridLineWidth: 0, title: nil, :min => 0})
      f.title({ :text=> nil})
      f.plot_options({:area=>{pointInterval: 1.day, marker: {enabled: false, symbol: 'circle',radius: 2,states: {hover: {enabled: true}}}, dataLabels: {enabled: data_labels}, showInLegend: show_in_legend}})
    end
  end
  
  # Pyk::Highcharts.funnel(data, series_name, render_to_name, background_color, show_in_legend=false, data_labels=false, text_color="black", neck_width="30%", neck_height="25%")
  def self.funnel(data, series_name, render_to_name, background_color, show_in_legend=false, data_labels=false, text_color="black", neck_width="30%", neck_height="25%")
    LazyHighCharts::HighChart.new('graph') do |f|
      f.chart({type: "funnel" , margin: [0, 0, 0, 0], backgroundColor: background_color, renderTo: render_to_name})
      f.series({name: series_name, data: data})
      f.options[:title][:text] = nil
      f.plotOptions(series: {:dataLabels=>{:enabled=>data_labels, format: '<b>{point.name}</b> ({point.y:,.0f})', color: text_color, softConnector: true}, neckWidth: neck_width, neckHeight: neck_height})
    end
  end
    
  # Pyk::Highcharts.stacked_bar_with_pie(data, categories, pie_data, render_to_name, background_color)
  def self.stacked_bar_with_pie(data, categories, pie_data, render_to_name, background_color, show_in_legend=false, data_labels=false, height=nil)
    LazyHighCharts::HighChart.new('column') do |f|
      f.chart({ backgroundColor: background_color, renderTo: render_to_name, :defaultSeriesType=>"column", height: height} )
      if pie_data.first.present?
        pie_data.each do |pie|
          f.series(:type=> 'pie',:name=> nil, :data=> [{:name=> pie[0], :y=> pie[1], :color=> pie[2]}], :center=> [pie[3], 5], :size=> 20, :showInLegend=> false, enableMouseTracking: false)
        end
      end
      data.each do |d|
        f.series(:type=> 'column',:name=> d[0],:data=> d[1], borderWidth: 0, stack: d[2], color: d[3])
      end
      f.xAxis({categories: categories, gridLineWidth: 0, :labels=>{:rotation=>0 , :align => 'right'}, type: :date})
      f.legend({layout: "horizontal", :borderWidth => 0, enabled: show_in_legend})
      f.yAxis({gridLineWidth: 0, title: nil, :min => 0})
      f.title({ :text=> nil})
      f.plot_options({:column=>{:stacking => "normal"}, dataLabels: {enabled: data_labels}, showInLegend: show_in_legend})
    end
  end
  
end