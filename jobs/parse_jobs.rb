require 'xmlsimple'
require 'date'

mem = XmlSimple.xml_in("jobs.xml")
pdp = {}
db = {}
files = ["jobs_1d.csv", "jobs_2d.csv", "jobs_7d.csv", "jobs_30d.csv", "jobs_365d.csv"]
init_time = [1366120965, 1366036920, 1365509880, 1363672800, 1333843200]
(0..4).each do |it|
  File.open(files[it], "w") do |file|
    file.puts "unix_timestamp,active_jobs,readable_time"
    db = mem["rra"][it]
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
