import matplotlib.pyplot as plt

x = ["1", "10¹", "10²", "10³", "10⁴", "10⁵", "10⁶"]
y = [0.0, 0.0, 0.09, 1.14, 2.21, 3.34, 4.32]

colors = ["red", "orange", "yellow", "green", "cyan", "blue", "purple"]

plt.bar(x, y, color=colors)

plt.xlabel("Passos")
plt.ylabel("Entropia")
plt.title("Evolução da Entropia")

plt.show()
