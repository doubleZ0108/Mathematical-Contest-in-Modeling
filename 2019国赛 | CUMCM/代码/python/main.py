import matplotlib.pyplot as plt
import matplotlib
matplotlib.use('TkAgg')
import random
from threading import Thread,Timer
from time import sleep,time
import numpy as np
import sys


customers = []
waitTime = 0.5
STATE = 'DAY'       # 'NIGHT

def getCustomerNum():
    tmp = random.randint(1, 100)
    if tmp>=1 and tmp<=60:
        return 1
    elif tmp>=61 and tmp<=92:
        return 2
    elif tmp>=93 and tmp<=98:
        return 3
    elif tmp==99 or tmp==100:
        return 4

def growCustomer():
    time_per_planeNum = 60/33
    stepTime = random.uniform(0, time_per_planeNum)
    sleep(stepTime/10)

    # customer_mu = 36.833 if STATE=='DAY' else 110.488
    # customer_sigma = 7.488 if STATE=='DAY' else 22.464
    customer_mu = 36.688/6
    customer_sigma = 7.488/6

    customerNum = int(np.random.normal(customer_mu, customer_sigma, 1)[0])

    for _ in range(customerNum):
        customers.append(1)

    global timer
    timer = Timer(0.01, growCustomer)
    timer.start()

def getWaitTime(pos):

    global customers
    customers.clear()
    print(pos)

    total_waitTime = 0

    while pos>0:
        # print(pos)
        sleep(waitTime/100)
        total_waitTime += waitTime

        if customers:
            tmp = getCustomerNum()
            customerNum = min(tmp, len(customers))
            customers = customers[customerNum:]

            pos -= 1
        else:
            start = time()
            while not customers:
                pass
            end = time()

            tmp = getCustomerNum()
            customerNum = min(tmp, len(customers))
            customers = customers[customerNum:]

            pos -= 1
            total_waitTime += end-start

    return total_waitTime


def main():
    N = 100      # 蓄车池最大容量
    pos_x = [i for i in range(1, N)]
    waitTime_y = list(map(getWaitTime, pos_x))

    plt.figure()
    plt.plot(pos_x, waitTime_y)
    plt.xlabel('Waiting Position')
    plt.ylabel('Waiting Time')
    plt.show()

    global timer
    timer.cancel()


'''启动全局定时器'''
timer = Timer(0, growCustomer).start()


if __name__=='__main__':
    main()