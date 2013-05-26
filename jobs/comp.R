
jobs_data_year = read.csv("jobs_365d.csv", header=TRUE)
jobs_data_month = read.csv("jobs_30d.csv", header=TRUE)
jobs_month <- c(jobs_data_month$active_jobs)
jobs_year <- c(jobs_data_year$active_jobs)

time <- strptime(jobs_data_month$readable_time, "%Y/%m/%d %H:%M:%S")

mean(jobs_month)
sd(jobs_month)
xbar = mean(jobs_month)
mu0 = mean(jobs_year)
sigma = sd(jobs_month)
n = length(jobs_month)
z = (xbar - mu0)/(sigma/sqrt(n))
z

alpha = 0.05
z.half.alpha = qnorm(1-alpha/2)
z.region = c(-z.half.alpha, z.half.alpha)
z.region

testing = t.test(x=jobs_month, conf.level=0.95, alternative="two.sided", mu=mu0)
testing
# plot(testing)
# not working
var.test(jobs_year,jobs_month,alternative="greater")

n1 = length(jobs_year)-1
n2 = length(jobs_month)-1

var_prom = (n1*var.year + n2*var.m)/(n1+n2)

t.test(jobs_month, jobs_year, alternative="greater")
