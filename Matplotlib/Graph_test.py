import matplotlib.pyplot as plt

#### Matplotlib figures, axes and plots

# plt.figure()
#
# plt.plot([1, 2, 3, 4], [3, 5, 9, 25])
# plt.show()


#### How to draw a line graph with matplotlib

# plt.figure()

# plt.xlabel("Categories")
# plt.ylabel("Amounts")
# plt.title("Categories vs Amounts")
#
# lines = plt.plot(["Men", "Women", "Children"], [3, 5, 9])
# plt.show()


#### The object oriented approach with matplotlib


# figure = plt.figure()
# axes = figure.add_subplot()
# axes.set_title("A test line graph")
# axes.set_xlabel("Numbers")
# axes.set_ylabel("Occurrences")
# axes.plot([1, 2, 3, 4], [3, 5, 9, 25])
# plt.show()


#### How to add multiple subplots

# figure, (ax1, ax2) = plt.subplots(1, 2)
#
# ax1.plot([1, 2, 3, 4], [3, 5, 9, 25])
# ax2.plot([1, 2, 3, 4], [5, 7, 11, 17])
#
# plt.show()

