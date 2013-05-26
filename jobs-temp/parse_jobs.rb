require 'xmlsimple'
require 'date'

jobs_data = XmlSimple.xml_in("jobs_run_charco.xml")
pdp = {}
db = {}
files = ["jobs_charco_1d.csv", "jobs_charco_2d.csv", "jobs_charco_7d.csv", "jobs_charco_30d.csv", "jobs_charco_365d.csv"]
init_time = [1368784875, 1368700920, 1368176040, 1366333920 , 1336521600]
(0..4).each do |it|
  File.open(files[it], "w") do |file|
    file.puts "unix_timestamp,jobs,readable_time"
    db = jobs_data["rra"][it]
    pdp[it] = db["pdp_per_row"].first.to_i * 15

    time = init_time[it]
    db["database"].first["row"].each_with_index do |row, count|
      file.print time, ",", row["v"].first.to_f, ","
      date = Time.at(time).to_datetime
      file.print date.strftime("%Y/%m/%d %H:%M:%S"), "\n"
      time = time + pdp[it]
    end
  end
end
