import matplotlib.pyplot as plt
years=(1999,2002,2005,2007,2008,2010,2012,2014,2016,2018)
virat = [0, 0, 500, 800, 1100, 1300, 1500, 1800, 1900, 2100]
hardik = [0, 300, 800, 1200, 1500, 1700, 1600, 1400, 1000, 0]
rohit=[0,200,600,700,900,800,400,1350,1500,1900]

plt.plot(years,virat,'^k--',label="ViratKohli")
plt.plot(years,hardik,'m4:',label="HardikPandya")
plt.plot(years,rohit,'bD-.',label="RohitSharma")
plt.xlabel="Years"
plt.ylabel="Runs_Scored"
plt.title("Runs Of Players in Cricket..")
plt.legend()
plt.tight_layout()
plt.grid('true')
#plt.style.available
plt.style.use( 'seaborn-v0_8-colorblind')
plt.show()
