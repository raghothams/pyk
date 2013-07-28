class Pyk::Spreadsheet
  
  require 'roo'
  
  #MICROSOFT EXCEL STORES DATES AS THE NUMBER OF DAYS FROM 1900. HENCE CONVERSION IS REQUIRED
  
  #Pyk::Spreadsheet.process_date_from_xls(d)
  def self.process_date_from_xls(d)
    return nil if d.nil?
    d = d.to_i
    return (Date.new( 1899,12,30) + d)
  end
  
  #Pyk::Spreadsheet.is_excel?(data_file_name)
  def self.is_excel?(data_file_name)
    return (!data_file_name.index(".xls").nil? or !data_file_name.index(".ods").nil? or !data_file_name.index(".csv").nil?) ? true : false
  end
  
  #Pyk::Spreadsheet.open(url, name, domain)
  def self.open(url, name, domain)
    begin
      url_s = Rails.env.production? ? url.to_s.gsub(domain, "") : (BASE_URL + url.to_s)
      case File.extname(name)
        when ".csv" then  s = Csv.new(url_s, nil, :ignore)
        when ".xls" then  s = Excel.new(url_s, nil, :ignore)
        when ".xlsx" then s = Excelx.new(url_s, nil, :ignore)
        when ".ods" then  s = Openoffice.new(url_s, nil, :ignore)
        else raise "Unknown file type: #{name}"
      end
      s.default_sheet = s.sheets.first
      return s
    rescue
      return "1"
    end
  end
  
  #Pyk::Spreadsheet.to_process
  def self.to_process
    ExcelService.where(:pending_process => true)
  end
    
end