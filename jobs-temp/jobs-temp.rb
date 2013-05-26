require 'csv'
jobs_data = CSV.read("jobs_charco/jobs_charco_365d.csv")
jobs_data.shift
jobs_data
jobs_data.each {|r| puts r[1]}
temp_data = CSV.read("jobs_charco/temp_charco_365d.csv")
temp_data.shift
jobs_final = []
temp_final = []
jobs_data.each_with_index do |j, i|
  res = j[1].to_f
  if (res > 0.0)
    jobs_final << res
    temp_final << temp_data[i][1].to_f/10
  end
end

CSV.open("jobs-temp.csv", "w+") do |csv|
  csv << ["jobs", "temp"]
  jobs_final.each_with_index do |j, i|
    csv << [j, temp_final[i]]
  end
end
