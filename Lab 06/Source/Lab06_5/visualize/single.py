import matplotlib.pyplot as plt

# packet size = 100Kb
packetSize = 100e3
# bandwidth = 1Gbps
bandwidth = 1e9
# number of receiving host (torus2d 3x3: 4, torus3d 3x3: 13)
numRecvHost = 8
# interval time = 10ms
intervalTime = 0.01
# interval count
intervalCount = int(1 / intervalTime)


coefficient = packetSize / (bandwidth * numRecvHost * intervalTime) * 100

# file lưu số gói tin nhận được của tất cả các nút theo từng đơn vị interval time
path = "C:\\Users\\dranh\\Desktop\\Omnetpp-project\\Lab 06\\Source\\Lab06_5\\Result.txt"

f = open(path)
t = f.read().strip().split(' ')

throughput = []

for i in range(0, len(t)):
    throughput.append(int(t[i]) * coefficient)

plt.plot(throughput)
plt.xlabel('Interval')
plt.ylabel('Throughput (%)')
plt.show()

