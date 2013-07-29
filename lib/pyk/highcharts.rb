class Pyk::Highcharts
  
  # Pyk::Highcharts.pie(data, series_name, render_to_name, background_color)
  def self.pie(data, series_name, render_to_name, background_color)
    LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [0, 0, 0, 0], backgroundColor: background_color, renderTo: render_to_name})
      f.series({:type=> 'pie', :name=> series_name, :data=> data, borderWidth: 0})
      f.options[:title][:text] = nil
      f.legend(:layout=> 'vertical',:style=> {:left=> '0', :bottom=> '0',:right=> '0',:top=> '0'}) 
      f.plot_options(series: {pointPadding: 0,groupPadding: 0}, :pie=>{:allowPointSelect=>true, :cursor=>"pointer" , showInLegend: false, :dataLabels=>{:enabled=>false}})
    end
  end
  
  # Pyk::Highcharts.column(data, categories, series_name, render_to_name, background_color)
  def self.bar(data, categories, render_to_name, background_color)
    LazyHighCharts::HighChart.new('column') do |f|
      f.chart({ backgroundColor: background_color, renderTo: render_to_name, defaultSeriesType: "bar"} )
      data.each do |d|
        f.series(:name=>d[0],:data=> d[1], borderWidth: 0)
      end
      f.xAxis({categories: categories, gridLineWidth: 0})
      f.yAxis({gridLineWidth: 0, title: nil})
      f.title({ :text=> nil})
      f.plot_options({:bar=>{:stacking=>"normal", dataLabels: {enabled: true}, showInLegend: false}})
    end
  end
  
  # Pyk::Highcharts.areaspline_by_datetime(data, categories, series_name, render_to_name, background_color)
  def self.areaspline_by_datetime(data, categories, render_to_name, background_color)
    LazyHighCharts::HighChart.new('graph') do |f|
      f.chart({ backgroundColor: background_color, renderTo: render_to_name, :defaultSeriesType=>"areaspline"} )
      data.each do |d|
        f.series(:name=>d[0],:data=> d[1], borderWidth: 0)
      end      
      f.xAxis({categories: categories, gridLineWidth: 0, :labels=>{:rotation=>-45 , :align => 'right'}, type: :datetime})
      f.legend({layout: "horizontal", :borderWidth => 0})
      f.yAxis({gridLineWidth: 0, title: nil, :min => 0})
      f.title({ :text=> nil})
      f.plot_options({:area=>{pointInterval: 1.day, marker: {enabled: false, symbol: 'circle',radius: 2,states: {hover: {enabled: true}}}, dataLabels: {enabled: true}, showInLegend: false}})
    end
  end
  
end