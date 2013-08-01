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
  def self.column(data, categories, render_to_name, background_color, show_in_legend=false, data_labels=false)
    LazyHighCharts::HighChart.new('column') do |f|
      f.chart({ backgroundColor: background_color, renderTo: render_to_name, :defaultSeriesType=>"column"} )
      data.each do |d|
        f.series(:name=>d[0],:data=> d[1], borderWidth: 0)
      end
      f.xAxis({categories: categories, gridLineWidth: 0, :labels=>{:align => 'center'}, type: :string})
      f.yAxis({gridLineWidth: 0, title: nil, :min => 0})
      f.title({ :text=> nil})
      f.plot_options({:column=>{:stacking=>"normal", dataLabels: {enabled: data_labels}, showInLegend: show_in_legend}})     
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
  
end