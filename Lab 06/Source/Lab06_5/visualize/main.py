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

sumRecvMsg = [0 for i in range(0, intervalCount)]

# file lưu số gói tin nhận được của tất cả các nút theo từng đơn vị interval time
path0 = "C:\\Users\\dranh\\Desktop\\Omnetpp-project\\Lab 06\\Source\\Lab06_5\\Result"

triedTimes = 10

for i in range(0, triedTimes):
    path = path0 + str(i) + ".txt"
    f = open(path)
    t = f.read().strip().split(' ')
    print(path)
    print(t)
    for j in range(0, intervalCount):
        sumRecvMsg[j] += int(t[j])

throughput = []

for i in range(0, len(sumRecvMsg)):
    throughput.append(int(sumRecvMsg[i]) * coefficient / triedTimes)

plt.plot(throughput)
plt.xlabel('Interval')
plt.ylabel('Throughput (%)')
plt.show()

