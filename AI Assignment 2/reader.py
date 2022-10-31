import csv
from cmath import inf
# attributes: distance, city
distance = []
cities = []

# For knowledgebase.csv file
with open('roaddistance.csv', mode ='r')as file:
    csvFile = csv.reader(file)
    data = [i for i in csvFile]
    
    y = data[1][2:]
    y = y[:-1]

    x = [i[1] for i in data]
    x = x[2:]

    city = set()
    for abc in x:
        city.add(abc)
    
    for abc in y:
        city.add(abc)
    
    for abc in city:
        cities.append("city("+abc+").")
    
    x_ptr = 0
    count = 0
    for i in data[2:]:
        y_ptr = 0
        for j in i[2:][:-1]:
            temp = x[x_ptr].lower()+","+y[y_ptr].lower()+","
            temp1 = y[y_ptr].lower()+","+x[x_ptr].lower()+","
            if str(j) == '-':
                temp += "0\n"
                temp1 += "0\n"
            else:
                temp += str(j)+"\n"
                temp1 += str(j)+"\n"


            count += 1
            distance.append(temp)
            distance.append(temp1)
            y_ptr += 1
        x_ptr += 1
    print(count)


file1 = open("knowledgebase.csv", "w")
# print(distance)
file1.writelines(distance)
file1.close()


# For heurisitic.csv file
min = inf
with open('knowledgebase.csv', mode ='r') as file:
    csvFile = csv.reader(file)
    data = [i for i in csvFile]
    for i in range(len(data)):
        if int(data[i][2]) != 0:
            data[i][2] = int(data[i][2]) - 47
            if min > data[i][2]:
                min = data[i][2]
        data[i] = data[i][0]+","+data[i][1]+","+str(data[i][2])+"\n"

# print(data)
print("Min:", min)

file1 = open("heuristic.csv", "w")
# print(data)
file1.writelines(data)
file1.close()
