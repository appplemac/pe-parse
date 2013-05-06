jobs_data = read.csv("jobs_365d.csv", header=TRUE)
jobs <- c(jobs_data$active_jobs)
time <- strptime(jobs_data$readable_time, "%Y/%m/%d %H:%M:%S")

mean(jobs)
sd(jobs)
xbar = mean(jobs)
mu0 = 50
sigma = sd(jobs)
n = length(jobs)
z = (xbar - mu0)/(sigma/sqrt(n))
z

alpha = 0.05
z.half.alpha = qnorm(1-alpha/2)
z.region = c(-z.half.alpha, z.half.alpha)
z.region

t.test(x=jobs, conf.level=0.95)
